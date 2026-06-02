#!/bin/bash
if [[ "$OSTYPE" == "darwin"* ]]; then
  SED_ARGS=(-i '')
else
  SED_ARGS=(-i)
fi

sed "${SED_ARGS[@]}" -e 's/import '\''package:meread\/db\/database.dart'\'' as db;/import '\''package:meread\/db\/database.dart'\'' hide FeedModel, CategoryModel, PostModel;\nimport '\''package:meread\/db\/database.dart'\'' as db;/g' lib/models/category.dart
sed "${SED_ARGS[@]}" -e 's/import '\''package:meread\/db\/database.dart'\'' as db;/import '\''package:meread\/db\/database.dart'\'' hide FeedModel, CategoryModel, PostModel;\nimport '\''package:meread\/db\/database.dart'\'' as db;/g' lib/models/feed.dart
sed "${SED_ARGS[@]}" -e 's/import '\''package:meread\/db\/database.dart'\'' as db;/import '\''package:meread\/db\/database.dart'\'' hide FeedModel, CategoryModel, PostModel;\nimport '\''package:meread\/db\/database.dart'\'' as db;/g' lib/models/post.dart

sed "${SED_ARGS[@]}" -e 's/db\.Category dbCategory/db.CategoryModel dbCategory/g' lib/models/category.dart
sed "${SED_ARGS[@]}" -e 's/db\.Feed dbFeed/db.FeedModel dbFeed/g' lib/models/feed.dart
sed "${SED_ARGS[@]}" -e 's/db\.Post dbPost/db.PostModel dbPost/g' lib/models/post.dart
