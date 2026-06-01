// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Category> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(Insertable<Category> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Category(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }
}

class Category extends DataClass implements Insertable<Category> {
  final int id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Category(
      {required this.id,
      required this.name,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: Value(id),
      name: Value(name),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Category.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Category(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Category copyWith(
          {int? id, String? name, DateTime? createdAt, DateTime? updatedAt}) =>
      Category(
        id: id ?? this.id,
        name: name ?? this.name,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  Category copyWithCompanion(CategoriesCompanion data) {
    return Category(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category &&
          other.id == this.id &&
          other.name == this.name &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required DateTime createdAt,
    required DateTime updatedAt,
  })  : name = Value(name),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<Category> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  CategoriesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return CategoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $FeedsTable extends Feeds with TableInfo<$FeedsTable, Feed> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FeedsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
      'category_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES categories (id)'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fullTextMeta =
      const VerificationMeta('fullText');
  @override
  late final GeneratedColumn<bool> fullText = GeneratedColumn<bool>(
      'full_text', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("full_text" IN (0, 1))'));
  static const VerificationMeta _openTypeMeta =
      const VerificationMeta('openType');
  @override
  late final GeneratedColumn<int> openType = GeneratedColumn<int>(
      'open_type', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, categoryId, title, url, description, fullText, openType];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'feeds';
  @override
  VerificationContext validateIntegrity(Insertable<Feed> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('full_text')) {
      context.handle(_fullTextMeta,
          fullText.isAcceptableOrUnknown(data['full_text']!, _fullTextMeta));
    } else if (isInserting) {
      context.missing(_fullTextMeta);
    }
    if (data.containsKey('open_type')) {
      context.handle(_openTypeMeta,
          openType.isAcceptableOrUnknown(data['open_type']!, _openTypeMeta));
    } else if (isInserting) {
      context.missing(_openTypeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Feed map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Feed(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category_id']),
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      url: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      fullText: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}full_text'])!,
      openType: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}open_type'])!,
    );
  }

  @override
  $FeedsTable createAlias(String alias) {
    return $FeedsTable(attachedDatabase, alias);
  }
}

class Feed extends DataClass implements Insertable<Feed> {
  final int id;
  final int? categoryId;
  final String title;
  final String url;
  final String description;
  final bool fullText;
  final int openType;
  const Feed(
      {required this.id,
      this.categoryId,
      required this.title,
      required this.url,
      required this.description,
      required this.fullText,
      required this.openType});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || categoryId != null) {
      map['category_id'] = Variable<int>(categoryId);
    }
    map['title'] = Variable<String>(title);
    map['url'] = Variable<String>(url);
    map['description'] = Variable<String>(description);
    map['full_text'] = Variable<bool>(fullText);
    map['open_type'] = Variable<int>(openType);
    return map;
  }

  FeedsCompanion toCompanion(bool nullToAbsent) {
    return FeedsCompanion(
      id: Value(id),
      categoryId: categoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryId),
      title: Value(title),
      url: Value(url),
      description: Value(description),
      fullText: Value(fullText),
      openType: Value(openType),
    );
  }

  factory Feed.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Feed(
      id: serializer.fromJson<int>(json['id']),
      categoryId: serializer.fromJson<int?>(json['categoryId']),
      title: serializer.fromJson<String>(json['title']),
      url: serializer.fromJson<String>(json['url']),
      description: serializer.fromJson<String>(json['description']),
      fullText: serializer.fromJson<bool>(json['fullText']),
      openType: serializer.fromJson<int>(json['openType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'categoryId': serializer.toJson<int?>(categoryId),
      'title': serializer.toJson<String>(title),
      'url': serializer.toJson<String>(url),
      'description': serializer.toJson<String>(description),
      'fullText': serializer.toJson<bool>(fullText),
      'openType': serializer.toJson<int>(openType),
    };
  }

  Feed copyWith(
          {int? id,
          Value<int?> categoryId = const Value.absent(),
          String? title,
          String? url,
          String? description,
          bool? fullText,
          int? openType}) =>
      Feed(
        id: id ?? this.id,
        categoryId: categoryId.present ? categoryId.value : this.categoryId,
        title: title ?? this.title,
        url: url ?? this.url,
        description: description ?? this.description,
        fullText: fullText ?? this.fullText,
        openType: openType ?? this.openType,
      );
  Feed copyWithCompanion(FeedsCompanion data) {
    return Feed(
      id: data.id.present ? data.id.value : this.id,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
      title: data.title.present ? data.title.value : this.title,
      url: data.url.present ? data.url.value : this.url,
      description:
          data.description.present ? data.description.value : this.description,
      fullText: data.fullText.present ? data.fullText.value : this.fullText,
      openType: data.openType.present ? data.openType.value : this.openType,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Feed(')
          ..write('id: $id, ')
          ..write('categoryId: $categoryId, ')
          ..write('title: $title, ')
          ..write('url: $url, ')
          ..write('description: $description, ')
          ..write('fullText: $fullText, ')
          ..write('openType: $openType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, categoryId, title, url, description, fullText, openType);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Feed &&
          other.id == this.id &&
          other.categoryId == this.categoryId &&
          other.title == this.title &&
          other.url == this.url &&
          other.description == this.description &&
          other.fullText == this.fullText &&
          other.openType == this.openType);
}

class FeedsCompanion extends UpdateCompanion<Feed> {
  final Value<int> id;
  final Value<int?> categoryId;
  final Value<String> title;
  final Value<String> url;
  final Value<String> description;
  final Value<bool> fullText;
  final Value<int> openType;
  const FeedsCompanion({
    this.id = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.title = const Value.absent(),
    this.url = const Value.absent(),
    this.description = const Value.absent(),
    this.fullText = const Value.absent(),
    this.openType = const Value.absent(),
  });
  FeedsCompanion.insert({
    this.id = const Value.absent(),
    this.categoryId = const Value.absent(),
    required String title,
    required String url,
    required String description,
    required bool fullText,
    required int openType,
  })  : title = Value(title),
        url = Value(url),
        description = Value(description),
        fullText = Value(fullText),
        openType = Value(openType);
  static Insertable<Feed> custom({
    Expression<int>? id,
    Expression<int>? categoryId,
    Expression<String>? title,
    Expression<String>? url,
    Expression<String>? description,
    Expression<bool>? fullText,
    Expression<int>? openType,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (categoryId != null) 'category_id': categoryId,
      if (title != null) 'title': title,
      if (url != null) 'url': url,
      if (description != null) 'description': description,
      if (fullText != null) 'full_text': fullText,
      if (openType != null) 'open_type': openType,
    });
  }

  FeedsCompanion copyWith(
      {Value<int>? id,
      Value<int?>? categoryId,
      Value<String>? title,
      Value<String>? url,
      Value<String>? description,
      Value<bool>? fullText,
      Value<int>? openType}) {
    return FeedsCompanion(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      title: title ?? this.title,
      url: url ?? this.url,
      description: description ?? this.description,
      fullText: fullText ?? this.fullText,
      openType: openType ?? this.openType,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (fullText.present) {
      map['full_text'] = Variable<bool>(fullText.value);
    }
    if (openType.present) {
      map['open_type'] = Variable<int>(openType.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FeedsCompanion(')
          ..write('id: $id, ')
          ..write('categoryId: $categoryId, ')
          ..write('title: $title, ')
          ..write('url: $url, ')
          ..write('description: $description, ')
          ..write('fullText: $fullText, ')
          ..write('openType: $openType')
          ..write(')'))
        .toString();
  }
}

class $PostsTable extends Posts with TableInfo<$PostsTable, Post> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PostsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _feedIdMeta = const VerificationMeta('feedId');
  @override
  late final GeneratedColumn<int> feedId = GeneratedColumn<int>(
      'feed_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES feeds (id) ON DELETE CASCADE'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _linkMeta = const VerificationMeta('link');
  @override
  late final GeneratedColumn<String> link = GeneratedColumn<String>(
      'link', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _pubDateMeta =
      const VerificationMeta('pubDate');
  @override
  late final GeneratedColumn<DateTime> pubDate = GeneratedColumn<DateTime>(
      'pub_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _readMeta = const VerificationMeta('read');
  @override
  late final GeneratedColumn<bool> read = GeneratedColumn<bool>(
      'read', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("read" IN (0, 1))'));
  static const VerificationMeta _favoriteMeta =
      const VerificationMeta('favorite');
  @override
  late final GeneratedColumn<bool> favorite = GeneratedColumn<bool>(
      'favorite', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("favorite" IN (0, 1))'));
  static const VerificationMeta _fullTextMeta =
      const VerificationMeta('fullText');
  @override
  late final GeneratedColumn<bool> fullText = GeneratedColumn<bool>(
      'full_text', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("full_text" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, feedId, title, link, content, pubDate, read, favorite, fullText];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'posts';
  @override
  VerificationContext validateIntegrity(Insertable<Post> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('feed_id')) {
      context.handle(_feedIdMeta,
          feedId.isAcceptableOrUnknown(data['feed_id']!, _feedIdMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('link')) {
      context.handle(
          _linkMeta, link.isAcceptableOrUnknown(data['link']!, _linkMeta));
    } else if (isInserting) {
      context.missing(_linkMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('pub_date')) {
      context.handle(_pubDateMeta,
          pubDate.isAcceptableOrUnknown(data['pub_date']!, _pubDateMeta));
    } else if (isInserting) {
      context.missing(_pubDateMeta);
    }
    if (data.containsKey('read')) {
      context.handle(
          _readMeta, read.isAcceptableOrUnknown(data['read']!, _readMeta));
    } else if (isInserting) {
      context.missing(_readMeta);
    }
    if (data.containsKey('favorite')) {
      context.handle(_favoriteMeta,
          favorite.isAcceptableOrUnknown(data['favorite']!, _favoriteMeta));
    } else if (isInserting) {
      context.missing(_favoriteMeta);
    }
    if (data.containsKey('full_text')) {
      context.handle(_fullTextMeta,
          fullText.isAcceptableOrUnknown(data['full_text']!, _fullTextMeta));
    } else if (isInserting) {
      context.missing(_fullTextMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Post map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Post(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      feedId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}feed_id']),
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      link: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}link'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      pubDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}pub_date'])!,
      read: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}read'])!,
      favorite: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}favorite'])!,
      fullText: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}full_text'])!,
    );
  }

  @override
  $PostsTable createAlias(String alias) {
    return $PostsTable(attachedDatabase, alias);
  }
}

class Post extends DataClass implements Insertable<Post> {
  final int id;
  final int? feedId;
  final String title;
  final String link;
  final String content;
  final DateTime pubDate;
  final bool read;
  final bool favorite;
  final bool fullText;
  const Post(
      {required this.id,
      this.feedId,
      required this.title,
      required this.link,
      required this.content,
      required this.pubDate,
      required this.read,
      required this.favorite,
      required this.fullText});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || feedId != null) {
      map['feed_id'] = Variable<int>(feedId);
    }
    map['title'] = Variable<String>(title);
    map['link'] = Variable<String>(link);
    map['content'] = Variable<String>(content);
    map['pub_date'] = Variable<DateTime>(pubDate);
    map['read'] = Variable<bool>(read);
    map['favorite'] = Variable<bool>(favorite);
    map['full_text'] = Variable<bool>(fullText);
    return map;
  }

  PostsCompanion toCompanion(bool nullToAbsent) {
    return PostsCompanion(
      id: Value(id),
      feedId:
          feedId == null && nullToAbsent ? const Value.absent() : Value(feedId),
      title: Value(title),
      link: Value(link),
      content: Value(content),
      pubDate: Value(pubDate),
      read: Value(read),
      favorite: Value(favorite),
      fullText: Value(fullText),
    );
  }

  factory Post.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Post(
      id: serializer.fromJson<int>(json['id']),
      feedId: serializer.fromJson<int?>(json['feedId']),
      title: serializer.fromJson<String>(json['title']),
      link: serializer.fromJson<String>(json['link']),
      content: serializer.fromJson<String>(json['content']),
      pubDate: serializer.fromJson<DateTime>(json['pubDate']),
      read: serializer.fromJson<bool>(json['read']),
      favorite: serializer.fromJson<bool>(json['favorite']),
      fullText: serializer.fromJson<bool>(json['fullText']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'feedId': serializer.toJson<int?>(feedId),
      'title': serializer.toJson<String>(title),
      'link': serializer.toJson<String>(link),
      'content': serializer.toJson<String>(content),
      'pubDate': serializer.toJson<DateTime>(pubDate),
      'read': serializer.toJson<bool>(read),
      'favorite': serializer.toJson<bool>(favorite),
      'fullText': serializer.toJson<bool>(fullText),
    };
  }

  Post copyWith(
          {int? id,
          Value<int?> feedId = const Value.absent(),
          String? title,
          String? link,
          String? content,
          DateTime? pubDate,
          bool? read,
          bool? favorite,
          bool? fullText}) =>
      Post(
        id: id ?? this.id,
        feedId: feedId.present ? feedId.value : this.feedId,
        title: title ?? this.title,
        link: link ?? this.link,
        content: content ?? this.content,
        pubDate: pubDate ?? this.pubDate,
        read: read ?? this.read,
        favorite: favorite ?? this.favorite,
        fullText: fullText ?? this.fullText,
      );
  Post copyWithCompanion(PostsCompanion data) {
    return Post(
      id: data.id.present ? data.id.value : this.id,
      feedId: data.feedId.present ? data.feedId.value : this.feedId,
      title: data.title.present ? data.title.value : this.title,
      link: data.link.present ? data.link.value : this.link,
      content: data.content.present ? data.content.value : this.content,
      pubDate: data.pubDate.present ? data.pubDate.value : this.pubDate,
      read: data.read.present ? data.read.value : this.read,
      favorite: data.favorite.present ? data.favorite.value : this.favorite,
      fullText: data.fullText.present ? data.fullText.value : this.fullText,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Post(')
          ..write('id: $id, ')
          ..write('feedId: $feedId, ')
          ..write('title: $title, ')
          ..write('link: $link, ')
          ..write('content: $content, ')
          ..write('pubDate: $pubDate, ')
          ..write('read: $read, ')
          ..write('favorite: $favorite, ')
          ..write('fullText: $fullText')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, feedId, title, link, content, pubDate, read, favorite, fullText);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Post &&
          other.id == this.id &&
          other.feedId == this.feedId &&
          other.title == this.title &&
          other.link == this.link &&
          other.content == this.content &&
          other.pubDate == this.pubDate &&
          other.read == this.read &&
          other.favorite == this.favorite &&
          other.fullText == this.fullText);
}

class PostsCompanion extends UpdateCompanion<Post> {
  final Value<int> id;
  final Value<int?> feedId;
  final Value<String> title;
  final Value<String> link;
  final Value<String> content;
  final Value<DateTime> pubDate;
  final Value<bool> read;
  final Value<bool> favorite;
  final Value<bool> fullText;
  const PostsCompanion({
    this.id = const Value.absent(),
    this.feedId = const Value.absent(),
    this.title = const Value.absent(),
    this.link = const Value.absent(),
    this.content = const Value.absent(),
    this.pubDate = const Value.absent(),
    this.read = const Value.absent(),
    this.favorite = const Value.absent(),
    this.fullText = const Value.absent(),
  });
  PostsCompanion.insert({
    this.id = const Value.absent(),
    this.feedId = const Value.absent(),
    required String title,
    required String link,
    required String content,
    required DateTime pubDate,
    required bool read,
    required bool favorite,
    required bool fullText,
  })  : title = Value(title),
        link = Value(link),
        content = Value(content),
        pubDate = Value(pubDate),
        read = Value(read),
        favorite = Value(favorite),
        fullText = Value(fullText);
  static Insertable<Post> custom({
    Expression<int>? id,
    Expression<int>? feedId,
    Expression<String>? title,
    Expression<String>? link,
    Expression<String>? content,
    Expression<DateTime>? pubDate,
    Expression<bool>? read,
    Expression<bool>? favorite,
    Expression<bool>? fullText,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (feedId != null) 'feed_id': feedId,
      if (title != null) 'title': title,
      if (link != null) 'link': link,
      if (content != null) 'content': content,
      if (pubDate != null) 'pub_date': pubDate,
      if (read != null) 'read': read,
      if (favorite != null) 'favorite': favorite,
      if (fullText != null) 'full_text': fullText,
    });
  }

  PostsCompanion copyWith(
      {Value<int>? id,
      Value<int?>? feedId,
      Value<String>? title,
      Value<String>? link,
      Value<String>? content,
      Value<DateTime>? pubDate,
      Value<bool>? read,
      Value<bool>? favorite,
      Value<bool>? fullText}) {
    return PostsCompanion(
      id: id ?? this.id,
      feedId: feedId ?? this.feedId,
      title: title ?? this.title,
      link: link ?? this.link,
      content: content ?? this.content,
      pubDate: pubDate ?? this.pubDate,
      read: read ?? this.read,
      favorite: favorite ?? this.favorite,
      fullText: fullText ?? this.fullText,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (feedId.present) {
      map['feed_id'] = Variable<int>(feedId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (link.present) {
      map['link'] = Variable<String>(link.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (pubDate.present) {
      map['pub_date'] = Variable<DateTime>(pubDate.value);
    }
    if (read.present) {
      map['read'] = Variable<bool>(read.value);
    }
    if (favorite.present) {
      map['favorite'] = Variable<bool>(favorite.value);
    }
    if (fullText.present) {
      map['full_text'] = Variable<bool>(fullText.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PostsCompanion(')
          ..write('id: $id, ')
          ..write('feedId: $feedId, ')
          ..write('title: $title, ')
          ..write('link: $link, ')
          ..write('content: $content, ')
          ..write('pubDate: $pubDate, ')
          ..write('read: $read, ')
          ..write('favorite: $favorite, ')
          ..write('fullText: $fullText')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $FeedsTable feeds = $FeedsTable(this);
  late final $PostsTable posts = $PostsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [categories, feeds, posts];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('feeds',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('posts', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}

typedef $$CategoriesTableCreateCompanionBuilder = CategoriesCompanion Function({
  Value<int> id,
  required String name,
  required DateTime createdAt,
  required DateTime updatedAt,
});
typedef $$CategoriesTableUpdateCompanionBuilder = CategoriesCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

final class $$CategoriesTableReferences
    extends BaseReferences<_$AppDatabase, $CategoriesTable, Category> {
  $$CategoriesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$FeedsTable, List<Feed>> _feedsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.feeds,
          aliasName:
              $_aliasNameGenerator(db.categories.id, db.feeds.categoryId));

  $$FeedsTableProcessedTableManager get feedsRefs {
    final manager = $$FeedsTableTableManager($_db, $_db.feeds)
        .filter((f) => f.categoryId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_feedsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$CategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  Expression<bool> feedsRefs(
      Expression<bool> Function($$FeedsTableFilterComposer f) f) {
    final $$FeedsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.feeds,
        getReferencedColumn: (t) => t.categoryId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$FeedsTableFilterComposer(
              $db: $db,
              $table: $db.feeds,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$CategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> feedsRefs<T extends Object>(
      Expression<T> Function($$FeedsTableAnnotationComposer a) f) {
    final $$FeedsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.feeds,
        getReferencedColumn: (t) => t.categoryId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$FeedsTableAnnotationComposer(
              $db: $db,
              $table: $db.feeds,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CategoriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CategoriesTable,
    Category,
    $$CategoriesTableFilterComposer,
    $$CategoriesTableOrderingComposer,
    $$CategoriesTableAnnotationComposer,
    $$CategoriesTableCreateCompanionBuilder,
    $$CategoriesTableUpdateCompanionBuilder,
    (Category, $$CategoriesTableReferences),
    Category,
    PrefetchHooks Function({bool feedsRefs})> {
  $$CategoriesTableTableManager(_$AppDatabase db, $CategoriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              CategoriesCompanion(
            id: id,
            name: name,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required DateTime createdAt,
            required DateTime updatedAt,
          }) =>
              CategoriesCompanion.insert(
            id: id,
            name: name,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CategoriesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({feedsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (feedsRefs) db.feeds],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (feedsRefs)
                    await $_getPrefetchedData<Category, $CategoriesTable, Feed>(
                        currentTable: table,
                        referencedTable:
                            $$CategoriesTableReferences._feedsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CategoriesTableReferences(db, table, p0)
                                .feedsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.categoryId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$CategoriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CategoriesTable,
    Category,
    $$CategoriesTableFilterComposer,
    $$CategoriesTableOrderingComposer,
    $$CategoriesTableAnnotationComposer,
    $$CategoriesTableCreateCompanionBuilder,
    $$CategoriesTableUpdateCompanionBuilder,
    (Category, $$CategoriesTableReferences),
    Category,
    PrefetchHooks Function({bool feedsRefs})>;
typedef $$FeedsTableCreateCompanionBuilder = FeedsCompanion Function({
  Value<int> id,
  Value<int?> categoryId,
  required String title,
  required String url,
  required String description,
  required bool fullText,
  required int openType,
});
typedef $$FeedsTableUpdateCompanionBuilder = FeedsCompanion Function({
  Value<int> id,
  Value<int?> categoryId,
  Value<String> title,
  Value<String> url,
  Value<String> description,
  Value<bool> fullText,
  Value<int> openType,
});

final class $$FeedsTableReferences
    extends BaseReferences<_$AppDatabase, $FeedsTable, Feed> {
  $$FeedsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CategoriesTable _categoryIdTable(_$AppDatabase db) => db.categories
      .createAlias($_aliasNameGenerator(db.feeds.categoryId, db.categories.id));

  $$CategoriesTableProcessedTableManager? get categoryId {
    final $_column = $_itemColumn<int>('category_id');
    if ($_column == null) return null;
    final manager = $$CategoriesTableTableManager($_db, $_db.categories)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$PostsTable, List<Post>> _postsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.posts,
          aliasName: $_aliasNameGenerator(db.feeds.id, db.posts.feedId));

  $$PostsTableProcessedTableManager get postsRefs {
    final manager = $$PostsTableTableManager($_db, $_db.posts)
        .filter((f) => f.feedId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_postsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$FeedsTableFilterComposer extends Composer<_$AppDatabase, $FeedsTable> {
  $$FeedsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get url => $composableBuilder(
      column: $table.url, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get fullText => $composableBuilder(
      column: $table.fullText, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get openType => $composableBuilder(
      column: $table.openType, builder: (column) => ColumnFilters(column));

  $$CategoriesTableFilterComposer get categoryId {
    final $$CategoriesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $db.categories,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableFilterComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> postsRefs(
      Expression<bool> Function($$PostsTableFilterComposer f) f) {
    final $$PostsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.posts,
        getReferencedColumn: (t) => t.feedId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PostsTableFilterComposer(
              $db: $db,
              $table: $db.posts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$FeedsTableOrderingComposer
    extends Composer<_$AppDatabase, $FeedsTable> {
  $$FeedsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get url => $composableBuilder(
      column: $table.url, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get fullText => $composableBuilder(
      column: $table.fullText, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get openType => $composableBuilder(
      column: $table.openType, builder: (column) => ColumnOrderings(column));

  $$CategoriesTableOrderingComposer get categoryId {
    final $$CategoriesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $db.categories,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableOrderingComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$FeedsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FeedsTable> {
  $$FeedsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<bool> get fullText =>
      $composableBuilder(column: $table.fullText, builder: (column) => column);

  GeneratedColumn<int> get openType =>
      $composableBuilder(column: $table.openType, builder: (column) => column);

  $$CategoriesTableAnnotationComposer get categoryId {
    final $$CategoriesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $db.categories,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableAnnotationComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> postsRefs<T extends Object>(
      Expression<T> Function($$PostsTableAnnotationComposer a) f) {
    final $$PostsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.posts,
        getReferencedColumn: (t) => t.feedId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PostsTableAnnotationComposer(
              $db: $db,
              $table: $db.posts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$FeedsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FeedsTable,
    Feed,
    $$FeedsTableFilterComposer,
    $$FeedsTableOrderingComposer,
    $$FeedsTableAnnotationComposer,
    $$FeedsTableCreateCompanionBuilder,
    $$FeedsTableUpdateCompanionBuilder,
    (Feed, $$FeedsTableReferences),
    Feed,
    PrefetchHooks Function({bool categoryId, bool postsRefs})> {
  $$FeedsTableTableManager(_$AppDatabase db, $FeedsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FeedsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FeedsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FeedsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> categoryId = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> url = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<bool> fullText = const Value.absent(),
            Value<int> openType = const Value.absent(),
          }) =>
              FeedsCompanion(
            id: id,
            categoryId: categoryId,
            title: title,
            url: url,
            description: description,
            fullText: fullText,
            openType: openType,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> categoryId = const Value.absent(),
            required String title,
            required String url,
            required String description,
            required bool fullText,
            required int openType,
          }) =>
              FeedsCompanion.insert(
            id: id,
            categoryId: categoryId,
            title: title,
            url: url,
            description: description,
            fullText: fullText,
            openType: openType,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$FeedsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({categoryId = false, postsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (postsRefs) db.posts],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (categoryId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.categoryId,
                    referencedTable:
                        $$FeedsTableReferences._categoryIdTable(db),
                    referencedColumn:
                        $$FeedsTableReferences._categoryIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (postsRefs)
                    await $_getPrefetchedData<Feed, $FeedsTable, Post>(
                        currentTable: table,
                        referencedTable:
                            $$FeedsTableReferences._postsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$FeedsTableReferences(db, table, p0).postsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.feedId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$FeedsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $FeedsTable,
    Feed,
    $$FeedsTableFilterComposer,
    $$FeedsTableOrderingComposer,
    $$FeedsTableAnnotationComposer,
    $$FeedsTableCreateCompanionBuilder,
    $$FeedsTableUpdateCompanionBuilder,
    (Feed, $$FeedsTableReferences),
    Feed,
    PrefetchHooks Function({bool categoryId, bool postsRefs})>;
typedef $$PostsTableCreateCompanionBuilder = PostsCompanion Function({
  Value<int> id,
  Value<int?> feedId,
  required String title,
  required String link,
  required String content,
  required DateTime pubDate,
  required bool read,
  required bool favorite,
  required bool fullText,
});
typedef $$PostsTableUpdateCompanionBuilder = PostsCompanion Function({
  Value<int> id,
  Value<int?> feedId,
  Value<String> title,
  Value<String> link,
  Value<String> content,
  Value<DateTime> pubDate,
  Value<bool> read,
  Value<bool> favorite,
  Value<bool> fullText,
});

final class $$PostsTableReferences
    extends BaseReferences<_$AppDatabase, $PostsTable, Post> {
  $$PostsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $FeedsTable _feedIdTable(_$AppDatabase db) =>
      db.feeds.createAlias($_aliasNameGenerator(db.posts.feedId, db.feeds.id));

  $$FeedsTableProcessedTableManager? get feedId {
    final $_column = $_itemColumn<int>('feed_id');
    if ($_column == null) return null;
    final manager = $$FeedsTableTableManager($_db, $_db.feeds)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_feedIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$PostsTableFilterComposer extends Composer<_$AppDatabase, $PostsTable> {
  $$PostsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get link => $composableBuilder(
      column: $table.link, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get pubDate => $composableBuilder(
      column: $table.pubDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get read => $composableBuilder(
      column: $table.read, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get favorite => $composableBuilder(
      column: $table.favorite, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get fullText => $composableBuilder(
      column: $table.fullText, builder: (column) => ColumnFilters(column));

  $$FeedsTableFilterComposer get feedId {
    final $$FeedsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.feedId,
        referencedTable: $db.feeds,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$FeedsTableFilterComposer(
              $db: $db,
              $table: $db.feeds,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PostsTableOrderingComposer
    extends Composer<_$AppDatabase, $PostsTable> {
  $$PostsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get link => $composableBuilder(
      column: $table.link, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get pubDate => $composableBuilder(
      column: $table.pubDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get read => $composableBuilder(
      column: $table.read, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get favorite => $composableBuilder(
      column: $table.favorite, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get fullText => $composableBuilder(
      column: $table.fullText, builder: (column) => ColumnOrderings(column));

  $$FeedsTableOrderingComposer get feedId {
    final $$FeedsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.feedId,
        referencedTable: $db.feeds,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$FeedsTableOrderingComposer(
              $db: $db,
              $table: $db.feeds,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PostsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PostsTable> {
  $$PostsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get link =>
      $composableBuilder(column: $table.link, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<DateTime> get pubDate =>
      $composableBuilder(column: $table.pubDate, builder: (column) => column);

  GeneratedColumn<bool> get read =>
      $composableBuilder(column: $table.read, builder: (column) => column);

  GeneratedColumn<bool> get favorite =>
      $composableBuilder(column: $table.favorite, builder: (column) => column);

  GeneratedColumn<bool> get fullText =>
      $composableBuilder(column: $table.fullText, builder: (column) => column);

  $$FeedsTableAnnotationComposer get feedId {
    final $$FeedsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.feedId,
        referencedTable: $db.feeds,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$FeedsTableAnnotationComposer(
              $db: $db,
              $table: $db.feeds,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PostsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PostsTable,
    Post,
    $$PostsTableFilterComposer,
    $$PostsTableOrderingComposer,
    $$PostsTableAnnotationComposer,
    $$PostsTableCreateCompanionBuilder,
    $$PostsTableUpdateCompanionBuilder,
    (Post, $$PostsTableReferences),
    Post,
    PrefetchHooks Function({bool feedId})> {
  $$PostsTableTableManager(_$AppDatabase db, $PostsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PostsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PostsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PostsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> feedId = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> link = const Value.absent(),
            Value<String> content = const Value.absent(),
            Value<DateTime> pubDate = const Value.absent(),
            Value<bool> read = const Value.absent(),
            Value<bool> favorite = const Value.absent(),
            Value<bool> fullText = const Value.absent(),
          }) =>
              PostsCompanion(
            id: id,
            feedId: feedId,
            title: title,
            link: link,
            content: content,
            pubDate: pubDate,
            read: read,
            favorite: favorite,
            fullText: fullText,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> feedId = const Value.absent(),
            required String title,
            required String link,
            required String content,
            required DateTime pubDate,
            required bool read,
            required bool favorite,
            required bool fullText,
          }) =>
              PostsCompanion.insert(
            id: id,
            feedId: feedId,
            title: title,
            link: link,
            content: content,
            pubDate: pubDate,
            read: read,
            favorite: favorite,
            fullText: fullText,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$PostsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({feedId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (feedId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.feedId,
                    referencedTable: $$PostsTableReferences._feedIdTable(db),
                    referencedColumn:
                        $$PostsTableReferences._feedIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$PostsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PostsTable,
    Post,
    $$PostsTableFilterComposer,
    $$PostsTableOrderingComposer,
    $$PostsTableAnnotationComposer,
    $$PostsTableCreateCompanionBuilder,
    $$PostsTableUpdateCompanionBuilder,
    (Post, $$PostsTableReferences),
    Post,
    PrefetchHooks Function({bool feedId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db, _db.categories);
  $$FeedsTableTableManager get feeds =>
      $$FeedsTableTableManager(_db, _db.feeds);
  $$PostsTableTableManager get posts =>
      $$PostsTableTableManager(_db, _db.posts);
}
