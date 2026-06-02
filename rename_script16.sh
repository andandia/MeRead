#!/bin/bash
if [[ "$OSTYPE" == "darwin"* ]]; then
  SED_ARGS=(-i '')
else
  SED_ARGS=(-i)
fi

find lib/helpers -type f -name "db_helper.dart" -print0 | xargs -0 sed "${SED_ARGS[@]}" -e 's/_db\.getFeedsWithCategory()/_db.getFeedsWithCategoryModel()/g'
find lib/helpers -type f -name "db_helper.dart" -print0 | xargs -0 sed "${SED_ARGS[@]}" -e 's/_db\.getPostsWithFeed()/_db.getPostsWithFeedModel()/g'
find lib/helpers -type f -name "db_helper.dart" -print0 | xargs -0 sed "${SED_ARGS[@]}" -e 's/_db\.saveFeed(/_db.saveFeedModel(/g'
find lib/helpers -type f -name "db_helper.dart" -print0 | xargs -0 sed "${SED_ARGS[@]}" -e 's/_db\.deleteFeed(/_db.deleteFeedModel(/g'
find lib/helpers -type f -name "db_helper.dart" -print0 | xargs -0 sed "${SED_ARGS[@]}" -e 's/_db\.savePost(/_db.savePostModel(/g'
