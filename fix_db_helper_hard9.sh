#!/bin/bash
if [[ "$OSTYPE" == "darwin"* ]]; then
  SED_ARGS=(-i '')
else
  SED_ARGS=(-i)
fi

sed "${SED_ARGS[@]}" -e 's/as post_model\.PostModel/as db.Post/g' lib/helpers/db_helper.dart
sed "${SED_ARGS[@]}" -e 's/as category_model\.CategoryModel/as db.Category/g' lib/helpers/db_helper.dart
