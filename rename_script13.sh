#!/bin/bash
if [[ "$OSTYPE" == "darwin"* ]]; then
  SED_ARGS=(-i '')
else
  SED_ARGS=(-i)
fi

find lib/helpers -type f -name "db_helper.dart" -print0 | xargs -0 sed "${SED_ARGS[@]}" -e 's/import '\''package:meread\/models\/category.dart'\'';//g'
find lib/helpers -type f -name "db_helper.dart" -print0 | xargs -0 sed "${SED_ARGS[@]}" -e 's/import '\''package:meread\/models\/feed.dart'\'';//g'
find lib/helpers -type f -name "db_helper.dart" -print0 | xargs -0 sed "${SED_ARGS[@]}" -e 's/import '\''package:meread\/models\/post.dart'\'';//g'

find lib/helpers -type f -name "db_helper.dart" -print0 | xargs -0 sed "${SED_ARGS[@]}" -e 's/import '\''package:meread\/helpers\/log_helper.dart'\'';/import '\''package:meread\/helpers\/log_helper.dart'\'';\nimport '\''package:meread\/models\/category.dart'\'' as category_model;\nimport '\''package:meread\/models\/feed.dart'\'' as feed_model;\nimport '\''package:meread\/models\/post.dart'\'' as post_model;/g'

find lib/helpers -type f -name "db_helper.dart" -print0 | xargs -0 sed "${SED_ARGS[@]}" -e 's/CategoryModel/category_model.CategoryModel/g'
find lib/helpers -type f -name "db_helper.dart" -print0 | xargs -0 sed "${SED_ARGS[@]}" -e 's/FeedModel/feed_model.FeedModel/g'
find lib/helpers -type f -name "db_helper.dart" -print0 | xargs -0 sed "${SED_ARGS[@]}" -e 's/PostModel/post_model.PostModel/g'
