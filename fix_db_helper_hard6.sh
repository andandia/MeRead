#!/bin/bash
if [[ "$OSTYPE" == "darwin"* ]]; then
  SED_ARGS=(-i '')
else
  SED_ARGS=(-i)
fi

sed "${SED_ARGS[@]}" -e 's/p!,/p as db.Post,/g' lib/helpers/db_helper.dart
sed "${SED_ARGS[@]}" -e 's/pf\.post!/pf.post as db.Post/g' lib/helpers/db_helper.dart
sed "${SED_ARGS[@]}" -e 's/c!)/c as db.Category)/g' lib/helpers/db_helper.dart
sed "${SED_ARGS[@]}" -e 's/pf\.post as db\.Post,/pf.post as db.Post,/g' lib/helpers/db_helper.dart
