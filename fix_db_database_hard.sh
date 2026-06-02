#!/bin/bash
cat << 'INNER_EOF' > lib/db/database.dart
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:meread/db/tables.dart';

part 'database.g.dart';

class FeedWithCategoryModel {
  final Feed feed;
  final Category? category;
  FeedWithCategoryModel(this.feed, this.category);
}

class PostWithFeedModel {
  final Post post;
  final Feed? feed;
  PostWithFeedModel(this.post, this.feed);
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = Platform.isAndroid
        ? await getApplicationDocumentsDirectory()
        : await getApplicationSupportDirectory();
    final file = File(p.join(dbFolder.path, 'meread.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}

@DriftDatabase(tables: [Categories, Feeds, Posts])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      beforeOpen: (details) async {
        await customStatement('PRAGMA foreign_keys = ON');
      },
    );
  }

  // --- Categories ---
  Future<List<Category>> getCategories() => select(categories).get();

  Future<Category?> getCategoryByName(String name) {
    return (select(categories)..where((t) => t.name.equals(name))).getSingleOrNull();
  }

  Future<int> saveCategoryModel(CategoriesCompanion entry) {
    return into(categories).insert(entry, mode: InsertMode.insertOrReplace);
  }

  // --- Feeds ---
  Future<List<FeedWithCategoryModel>> getFeedsWithCategoryModel() async {
    final query = select(feeds).join([
      leftOuterJoin(categories, categories.id.equalsExp(feeds.categoryId)),
    ]);

    final result = await query.get();
    return result.map((row) {
      return FeedWithCategoryModel(
        row.readTable(feeds),
        row.readTableOrNull(categories),
      );
    }).toList();
  }

  Future<List<Feed>> getFeeds() => select(feeds).get();

  Future<int> saveFeedModel(FeedsCompanion entry) {
    return into(feeds).insert(entry, mode: InsertMode.insertOrReplace);
  }

  Future<Feed?> getFeedByUrl(String url) {
    return (select(feeds)..where((t) => t.url.equals(url))).getSingleOrNull();
  }

  Future<void> deleteFeedModel(Feed feed) async {
    await transaction(() async {
      await (delete(posts)..where((t) => t.feedId.equals(feed.id))).go();
      await (delete(feeds)..where((t) => t.id.equals(feed.id))).go();
    });
  }

  // --- Posts ---
  Future<List<PostWithFeedModel>> getPostsWithFeedModel() async {
    final query = select(posts).join([
      leftOuterJoin(feeds, feeds.id.equalsExp(posts.feedId)),
    ]);

    final result = await query.get();
    return result.map((row) {
      return PostWithFeedModel(
        row.readTable(posts),
        row.readTableOrNull(feeds),
      );
    }).toList();
  }

  Future<List<Post>> getPosts() => select(posts).get();

  Future<int> savePostModel(PostsCompanion entry) {
    return into(posts).insert(entry, mode: InsertMode.insertOrReplace);
  }

  Future<void> savePosts(List<PostsCompanion> entries) async {
    await batch((batch) {
      batch.insertAll(posts, entries, mode: InsertMode.insertOrReplace);
    });
  }

  Future<List<Post>> getPostsByFeedId(int feedId) {
    return (select(posts)
      ..where((t) => t.feedId.equals(feedId))
      ..orderBy([(t) => OrderingTerm(expression: t.pubDate, mode: OrderingMode.desc)]))
    .get();
  }

  Future<List<Post>> searchPosts(String queryStr) {
    return (select(posts)
      ..where((t) => t.title.contains(queryStr) | t.content.contains(queryStr)))
    .get();
  }

  Future<void> updatePostRead(Post post, bool read) {
    return (update(posts)..where((t) => t.id.equals(post.id)))
        .write(PostsCompanion(read: Value(read)));
  }

  Future<void> markAllRead(List<Post> postList) async {
    await batch((batch) {
      for (var post in postList) {
        batch.update(
          posts,
          PostsCompanion(read: const Value(true)),
          where: (t) => t.id.equals(post.id),
        );
      }
    });
  }
}
INNER_EOF
