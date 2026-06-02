#!/bin/bash
if [[ "$OSTYPE" == "darwin"* ]]; then
  SED_ARGS=(-i '')
else
  SED_ARGS=(-i)
fi

find lib/helpers -type f -name "db_helper.dart" -print0 | xargs -0 sed "${SED_ARGS[@]}" -e 's/import '\''package:meread\/db\/database.dart'\'' as app_db;/import '\''package:meread\/db\/database.dart'\'' hide Feed, Post, Category;\nimport '\''package:meread\/db\/tables.dart'\'' as tables;/g'
find lib/helpers -type f -name "db_helper.dart" -print0 | xargs -0 sed "${SED_ARGS[@]}" -e 's/app_db\.AppDatabase/AppDatabase/g'
find lib/helpers -type f -name "db_helper.dart" -print0 | xargs -0 sed "${SED_ARGS[@]}" -e 's/app_db\.Feed/Feed/g'
find lib/helpers -type f -name "db_helper.dart" -print0 | xargs -0 sed "${SED_ARGS[@]}" -e 's/app_db\.Post/Post/g'
