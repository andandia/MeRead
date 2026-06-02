#!/bin/bash
if [[ "$OSTYPE" == "darwin"* ]]; then
  SED_ARGS=(-i '')
else
  SED_ARGS=(-i)
fi

sed "${SED_ARGS[@]}" -e 's/class FeedWithCategoryModel {/class FeedWithCategoryModel {\n  final db_feed_model.FeedModel feed;\n  final db_category_model.CategoryModel? category;\n  FeedWithCategoryModel(this.feed, this.category);\n}/g' lib/db/database.dart
