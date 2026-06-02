// @dart=3.0
import 'package:drift/drift.dart';

@DataClassName('Category')
class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}

@DataClassName('Feed')
class Feeds extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get categoryId => integer().nullable().references(Categories, #id)();
  TextColumn get title => text()();
  TextColumn get url => text()();
  TextColumn get description => text()();
  BoolColumn get fullText => boolean()();
  IntColumn get openType => integer()();
}

@DataClassName('Post')
class Posts extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get feedId => integer().nullable().references(Feeds, #id, onDelete: KeyAction.cascade)();
  TextColumn get title => text()();
  TextColumn get link => text()();
  TextColumn get content => text()();
  DateTimeColumn get pubDate => dateTime()();
  BoolColumn get read => boolean()();
  BoolColumn get favorite => boolean()();
  BoolColumn get fullText => boolean()();
}
