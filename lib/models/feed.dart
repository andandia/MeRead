import 'package:meread/models/category.dart';
import 'package:meread/models/post.dart';
import 'package:meread/models/model_link.dart';
import 'package:meread/db/database.dart';
import 'package:drift/drift.dart';

class FeedModel {
  int? id;
  String title;
  String url;
  String description;
  final category = ModelLink<CategoryModel>();
  bool fullText;
  int openType; // 0: App Read, 1: In-app tab, 2: System browser

  final posts = ModelLinks<PostModel>();

  FeedModel({
    this.id,
    required this.title,
    required this.url,
    required this.description,
    required this.fullText,
    required this.openType,
  });

  factory FeedModel.fromDb(Feed dbFeed, {CategoryModel? categoryModel}) {
    final feedModel = FeedModel(
      id: dbFeed.id,
      title: dbFeed.title,
      url: dbFeed.url,
      description: dbFeed.description,
      fullText: dbFeed.fullText,
      openType: dbFeed.openType,
    );
    if (categoryModel != null) {
      feedModel.category.value = categoryModel;
    }
    return feedModel;
  }

  FeedsCompanion toDb() {
    return FeedsCompanion(
      id: id == null ? const Value.absent() : Value(id!),
      categoryId: category.value?.id == null ? const Value.absent() : Value(category.value!.id!),
      title: Value(title),
      url: Value(url),
      description: Value(description),
      fullText: Value(fullText),
      openType: Value(openType),
    );
  }
}
