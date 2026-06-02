#!/bin/bash
cat << 'INNER_EOF' > lib/helpers/db_helper.dart
import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:meread/db/database.dart' as db;
import 'package:meread/helpers/log_helper.dart';
import 'package:meread/models/category.dart' as category_model;
import 'package:meread/models/feed.dart' as feed_model;
import 'package:meread/models/post.dart' as post_model;

class DbHelper {
  static late db.AppDatabase _db;

  static Future<void> init() async {
    _db = db.AppDatabase();
    LogHelper.i('[Drift]: Open drift database.');
  }

  static db.AppDatabase get database => _db;

  static Future<List<feed_model.FeedModel>> getFeeds() async {
    final feedsWithCategory = await _db.getFeedsWithCategoryModel();
    return feedsWithCategory.map((fc) {
      category_model.CategoryModel? cModel;
      if (fc.category != null) {
        cModel = category_model.CategoryModel.fromDb(fc.category!);
      }
      return feed_model.FeedModel.fromDb(fc.feed, categoryModel: cModel);
    }).toList();
  }

  static Future<void> saveFeed(feed_model.FeedModel feedModel) async {
    await _db.saveFeedModel(feedModel.toDb());
  }

  static Future<feed_model.FeedModel?> isExistsFeed(String url) async {
    final feed = await _db.getFeedByUrl(url);
    if (feed != null) {
      return feed_model.FeedModel.fromDb(feed);
    }
    return null;
  }

  static Future<DateTime?> getLatesPubDate(feed_model.FeedModel feedModel) async {
    if (feedModel.id == null) return null;
    final posts = await _db.getPostsByFeedId(feedModel.id!);
    if (posts.isNotEmpty) {
      return posts.first.pubDate;
    }
    return null;
  }

  static Future<void> deleteFeed(feed_model.FeedModel feedModel) async {
    final dbFeed = db.FeedModel(
      id: feedModel.id!,
      categoryId: feedModel.category.value?.id,
      title: feedModel.title,
      url: feedModel.url,
      description: feedModel.description,
      fullText: feedModel.fullText,
      openType: feedModel.openType,
    );
    await _db.deleteFeedModel(dbFeed);
  }

  static Future<List<post_model.PostModel>> getPosts() async {
    final postsWithFeed = await _db.getPostsWithFeedModel();
    return postsWithFeed.map((pf) {
      feed_model.FeedModel? fModel;
      if (pf.feed != null) {
        fModel = feed_model.FeedModel.fromDb(pf.feed!);
      }
      return post_model.PostModel.fromDb(pf.post, feedModel: fModel);
    }).toList();
  }

  static Future<void> savePost(post_model.PostModel postModel) async {
    await _db.savePostModel(postModel.toDb());
  }

  static Future<List<post_model.PostModel>> getPostsByFeeds(List<feed_model.FeedModel> feeds) async {
    List<post_model.PostModel> result = [];
    for (final fModel in feeds) {
      if (fModel.id == null) continue;
      final posts = await _db.getPostsByFeedId(fModel.id!);
      result.addAll(posts.map((p) => post_model.PostModel.fromDb(p, feedModel: fModel)));
    }

    final Map<String, post_model.PostModel> uniquePostsMap = {
      for (var post in result) post.title: post
    };
    result = uniquePostsMap.values.toList();

    result.sort((a, b) => b.pubDate.compareTo(a.pubDate));

    result = getDescription(result);
    return result;
  }

  static Future<List<post_model.PostModel>> search(String value) async {
    if (value.isEmpty) {
      return [];
    }
    final result = await _db.searchPosts(value);
    return result.map((p) => post_model.PostModel.fromDb(p)).toList();
  }

  static Future<void> updatePostRead(post_model.PostModel postModel) async {
    if (postModel.id == null) return;
    postModel.read = !postModel.read;
    final dbPost = db.PostModel(
      id: postModel.id!,
      feedId: postModel.feed.value?.id,
      title: postModel.title,
      link: postModel.link,
      content: postModel.content,
      pubDate: postModel.pubDate,
      read: postModel.read,
      favorite: postModel.favorite,
      fullText: postModel.fullText,
    );
    await _db.updatePostRead(dbPost, postModel.read);
  }

  static Future<void> markAllRead(List<post_model.PostModel> postModels) async {
    List<db.PostModel> posts = postModels.where((pm) => pm.id != null).map((pm) {
      pm.read = true;
      return db.PostModel(
        id: pm.id!,
        feedId: pm.feed.value?.id,
        title: pm.title,
        link: pm.link,
        content: pm.content,
        pubDate: pm.pubDate,
        read: pm.read,
        favorite: pm.favorite,
        fullText: pm.fullText,
      );
    }).toList();
    await _db.markAllRead(posts);
  }

  static Future<List<category_model.CategoryModel>> getCategorys() async {
    final categories = await _db.getCategories();
    return categories.map((c) => category_model.CategoryModel.fromDb(c)).toList();
  }

  static Future<category_model.CategoryModel?> getCategoryByName(String name) async {
    final result = await _db.getCategoryByName(name);
    if (result != null) {
      return category_model.CategoryModel.fromDb(result);
    }
    return null;
  }

  static List<post_model.PostModel> getDescription(List<post_model.PostModel> list) {
    List<post_model.PostModel> result = list;

    for (post_model.PostModel post in list) {
      try {
        Document document = parse(post.content);
        post.content = document.body!.text;
      } catch (e) {
        continue;
      }
    }

    return result;
  }
}
INNER_EOF
