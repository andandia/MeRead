#!/bin/bash
if [[ "$OSTYPE" == "darwin"* ]]; then
  SED_ARGS=(-i '')
else
  SED_ARGS=(-i)
fi

sed "${SED_ARGS[@]}" -e 's/as db\.Category/as category_model.CategoryModel/g' lib/helpers/db_helper.dart
sed "${SED_ARGS[@]}" -e 's/as db\.Feed/as feed_model.FeedModel/g' lib/helpers/db_helper.dart
sed "${SED_ARGS[@]}" -e 's/as db\.Post/as post_model.PostModel/g' lib/helpers/db_helper.dart
sed "${SED_ARGS[@]}" -e 's/c!/c/g' lib/helpers/db_helper.dart
sed "${SED_ARGS[@]}" -e 's/pf\.post!/pf.post/g' lib/helpers/db_helper.dart
sed "${SED_ARGS[@]}" -e 's/p!/p/g' lib/helpers/db_helper.dart
