#!/bin/bash
if [[ "$OSTYPE" == "darwin"* ]]; then
  SED_ARGS=(-i '')
else
  SED_ARGS=(-i)
fi

find lib/helpers -type f -name "db_helper.dart" -print0 | xargs -0 sed "${SED_ARGS[@]}" -e "s/import 'package:meread\/db\/database.dart' as db;/import 'package:meread\/db\/database.dart' as app_db;/g"
find lib/helpers -type f -name "db_helper.dart" -print0 | xargs -0 sed "${SED_ARGS[@]}" -e "s/db.AppDatabase/app_db.AppDatabase/g"
find lib/helpers -type f -name "db_helper.dart" -print0 | xargs -0 sed "${SED_ARGS[@]}" -e "s/db.Feed(/app_db.Feed(/g"
find lib/helpers -type f -name "db_helper.dart" -print0 | xargs -0 sed "${SED_ARGS[@]}" -e "s/db.Post(/app_db.Post(/g"
find lib/helpers -type f -name "db_helper.dart" -print0 | xargs -0 sed "${SED_ARGS[@]}" -e "s/db.Post>/app_db.Post>/g"

find lib/ui/widgets -type f -name "feed_panel.dart" -print0 | xargs -0 sed "${SED_ARGS[@]}" -e "s/category.feeds.map/category.feeds.toList().map/g"
