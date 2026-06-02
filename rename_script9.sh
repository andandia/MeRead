#!/bin/bash
if [[ "$OSTYPE" == "darwin"* ]]; then
  SED_ARGS=(-i '')
else
  SED_ARGS=(-i)
fi

find lib/helpers lib/ui -type f -name "*.dart" -print0 | xargs -0 sed "${SED_ARGS[@]}" -e 's/DbHelper.saveFeedModel/DbHelper.saveFeed/g'
find lib/helpers lib/ui -type f -name "*.dart" -print0 | xargs -0 sed "${SED_ARGS[@]}" -e 's/DbHelper.deleteFeedModel/DbHelper.deleteFeed/g'
find lib/helpers lib/ui -type f -name "*.dart" -print0 | xargs -0 sed "${SED_ARGS[@]}" -e 's/DbHelper.savePostModel/DbHelper.savePost/g'
find lib/helpers lib/ui -type f -name "*.dart" -print0 | xargs -0 sed "${SED_ARGS[@]}" -e 's/DbHelper.isExistsFeedModel/DbHelper.isExistsFeed/g'
find lib/helpers -type f -name "db_helper.dart" -print0 | xargs -0 sed "${SED_ARGS[@]}" -e "s/import 'package:meread\/db\/database.dart';/import 'package:meread\/db\/database.dart' hide Feed, Category, Post;/g"
