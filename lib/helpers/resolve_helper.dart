import 'package:dart_rss/dart_rss.dart';
import 'package:dart_rss/domain/rss1_item.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:meread/helpers/dio_helper.dart';
import 'package:meread/helpers/db_helper.dart';
import 'package:meread/helpers/log_helper.dart';
import 'package:meread/helpers/prefs_helper.dart';
import 'package:meread/models/category.dart';
import 'package:meread/models/feed.dart';
import 'package:meread/models/post.dart';

class ResolveHelper {
  /// Parse a FeedModel with a url.
  static Future<FeedModel?> parseFeedModel(
    String url, [
    CategoryModel? category,
    String? feedTitle,
  ]) async {
    category ??= CategoryModel(
      name: 'defaultCategory'.tr,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    try {
      final response = await DioHelper.get(url);
      final postXmlString = response.data;
      try {
        /* Parse on RSS */
        final RssFeed rssFeed = RssFeed.parse(postXmlString);
        feedTitle = rssFeed.title;
        final FeedModel feed = FeedModel(
          title: feedTitle ?? '',
          url: url,
          description: rssFeed.description ?? '',
          fullText: false,
          openType: 0,
        );
        feed.category.value = category;
        return feed;
      } catch (e) {
        /* Parse on Atom */
        final AtomFeed atomFeed = AtomFeed.parse(postXmlString);
        final FeedModel feed = FeedModel(
          title: atomFeed.title ?? '',
          url: url,
          description: atomFeed.subtitle ?? '',
          fullText: false,
          openType: 0,
        );
        feed.category.value = category;
        return feed;
      }
    } catch (e) {
      LogHelper.e('[feed] Parse FeedModel Error: $e');
      return null;
    }
  }

  /// Parse List<FeedModel>
  static Future<List<int>> reslovePosts(List<FeedModel> feeds) async {
    int errorCount = 0;

    // Fetch deleted post URLs
    final deletedPosts = await DbHelper.getDeletedPosts();
    final Set<String> deletedUrls = deletedPosts.map((dp) => dp.link).toSet();

    for (final FeedModel feed in feeds) {
      bool res = await _reslovePostModel(feed, deletedUrls);
      if (!res) {
        errorCount++;
      }
    }
    return [feeds.length, errorCount];
  }

  /// Parse a FeedModel to get update
  /// 各投稿を解析するメイン処理
  static Future<bool> _reslovePostModel(FeedModel feed, Set<String> deletedUrls) async {
    try {
      final response = await DioHelper.get(feed.url);
      final postXmlString = response.data;
      final DateTime? feedLastUpdated = await DbHelper.getLatesPubDate(feed);
      try {
        Rss1Feed rss1Feed = Rss1Feed.parse(postXmlString);
        for (Rss1Item item in rss1Feed.items) {
          if (!(_parsePubDate(item.dc?.date)
              .isAfter(feedLastUpdated ?? DateTime(0)))) {
            break;
          }
          if (item.link != null && deletedUrls.contains(item.link)) continue;
          _parseRSSPostItemRss1(item, feed);
        }
        return true;
      } catch (e) {
        try {
          RssFeed rssFeed = RssFeed.parse(postXmlString);
          for (RssItem item in rssFeed.items) {
            if (!(_parsePubDate(item.pubDate)
                .isAfter(feedLastUpdated ?? DateTime(0)))) {
              break;
            }
            if (item.link != null && deletedUrls.contains(item.link)) continue;
            _parseRSSPostItemRss2(item, feed);
          }
          return true;
        } catch (e) {
          AtomFeed atomFeed = AtomFeed.parse(postXmlString);
          for (AtomItem item in atomFeed.items) {
            if (!(_parsePubDate(item.updated)
                .isAfter(feedLastUpdated ?? DateTime(0)))) {
              break;
            }
            final link = item.links.isNotEmpty ? item.links[0].href : null;
            if (link != null && deletedUrls.contains(link)) continue;
            _parseAtomPostItem(item, feed);
          }
          return true;
        }
      }
    } catch (e) {
      return false;
    }
  }

  /// Use RSS to parse RssItem and save to database
  /// Rss v1の場合のパース処理
  static void _parseRSSPostItemRss1(Rss1Item item, FeedModel feed) {
    String title = item.title!.trim();
    bool blockStatue = _isBlock(title, item.description ?? '');
    if (blockStatue) {
      return;
    }
    PostModel post = PostModel(
      title: title,
      link: item.link!,
      content: item.description ?? '',
      pubDate: _parsePubDate(item.dc?.date),
      read: false,
      favorite: false,
      fullText: feed.fullText,
    );
    post.feed.value = feed;
    DbHelper.savePost(post);
  }

  /// Use RSS to parse RssItem and save to database
  /// RSS2の場合のパース処理
  static void _parseRSSPostItemRss2(RssItem item, FeedModel feed) {
    String title = item.title!.trim();
    bool blockStatue = _isBlock(title, item.description ?? '');
    if (blockStatue) {
      return;
    }
    PostModel post = PostModel(
      title: title,
      link: item.link!,
      content: item.description ?? '',
      pubDate: _parsePubDate(item.pubDate),
      read: false,
      favorite: false,
      fullText: feed.fullText,
    );
    post.feed.value = feed;
    DbHelper.savePost(post);
  }

  /// Use Atom to parse RssItem and save to database
  /// Atomの場合のパース処理
  static void _parseAtomPostItem(AtomItem item, FeedModel feed) {
    String title = item.title!.trim();
    bool blockStatue = _isBlock(title, item.content ?? '');
    if (blockStatue) {
      return;
    }
    PostModel post = PostModel(
      title: title,
      link: item.links[0].href!,
      content: item.content!,
      pubDate: _parsePubDate(item.updated),
      read: false,
      favorite: false,
      fullText: feed.fullText,
    );
    post.feed.value = feed;
    DbHelper.savePost(post);
  }

  /// Determine whether the PostModel is blocked by title and content
  /// タイトルにNGワードが無いかチェック
  static bool _isBlock(String title, String content) {
    List<String> blockList = PrefsHelper.blockList;
    bool blockStatue = false;
    for (String block in blockList) {
      if (title.contains(block) || content.contains(block)) {
        blockStatue = true;
        break;
      }
    }
    return blockStatue;
  }

  /// PostModel pubDate format conversion
  /// 投稿日のパース処理
  static DateTime _parsePubDate(String? str) {
    if (str == null) {
      return DateTime.now();
    }
    const dateFormatPatterns = [
      'EEE, d MMM yyyy HH:mm:ss Z',
    ];
    try {
      return DateTime.parse(str);
    } catch (_) {
      for (final pattern in dateFormatPatterns) {
        try {
          final format = DateFormat(pattern);
          return format.parse(str);
        } catch (_) {}
      }
    }
    return DateTime.now();
  }
}
