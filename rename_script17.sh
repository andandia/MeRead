#!/bin/bash
if [[ "$OSTYPE" == "darwin"* ]]; then
  SED_ARGS=(-i '')
else
  SED_ARGS=(-i)
fi

find lib/helpers -type f -name "db_helper.dart" -print0 | xargs -0 sed "${SED_ARGS[@]}" -e 's/db\.Feed(/feed_model.FeedModel(/g'
find lib/helpers -type f -name "db_helper.dart" -print0 | xargs -0 sed "${SED_ARGS[@]}" -e 's/db\.Post/post_model.PostModel/g'
