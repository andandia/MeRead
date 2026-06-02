import 'package:meread/models/feed.dart';
import 'package:meread/models/model_link.dart';
import 'package:meread/db/database.dart';
import 'package:drift/drift.dart';

class CategoryModel {
  int? id;
  String name;
  DateTime createdAt;
  DateTime updatedAt;

  final feeds = ModelLinks<FeedModel>();

  CategoryModel({
    this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CategoryModel.fromDb(Category dbCategory) {
    return CategoryModel(
      id: dbCategory.id,
      name: dbCategory.name,
      createdAt: dbCategory.createdAt,
      updatedAt: dbCategory.updatedAt,
    );
  }

  CategoriesCompanion toDb() {
    return CategoriesCompanion(
      id: id == null ? const Value.absent() : Value(id!),
      name: Value(name),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }
}
