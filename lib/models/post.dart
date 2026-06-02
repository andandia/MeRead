import 'package:meread/models/feed.dart';
import 'package:meread/models/model_link.dart';
import 'package:meread/db/database.dart';
import 'package:drift/drift.dart';

class PostModel {
  int? id;
  final feed = ModelLink<FeedModel>();
  String title;
  String link;
  String content;
  DateTime pubDate;
  bool read;
  bool favorite;
  bool fullText;

  PostModel({
    this.id,
    required this.title,
    required this.link,
    required this.content,
    required this.pubDate,
    required this.read,
    required this.favorite,
    required this.fullText,
  });

  factory PostModel.fromDb(Post dbPost, {FeedModel? feedModel}) {
    final postModel = PostModel(
      id: dbPost.id,
      title: dbPost.title,
      link: dbPost.link,
      content: dbPost.content,
      pubDate: dbPost.pubDate,
      read: dbPost.read,
      favorite: dbPost.favorite,
      fullText: dbPost.fullText,
    );
    if (feedModel != null) {
      postModel.feed.value = feedModel;
    }
    return postModel;
  }

  PostsCompanion toDb() {
    return PostsCompanion(
      id: id == null ? const Value.absent() : Value(id!),
      feedId: feed.value?.id == null ? const Value.absent() : Value(feed.value!.id!),
      title: Value(title),
      link: Value(link),
      content: Value(content),
      pubDate: Value(pubDate),
      read: Value(read),
      favorite: Value(favorite),
      fullText: Value(fullText),
    );
  }
}
