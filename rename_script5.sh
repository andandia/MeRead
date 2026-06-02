#!/bin/bash
if [[ "$OSTYPE" == "darwin"* ]]; then
  SED_ARGS=(-i '')
else
  SED_ARGS=(-i)
fi

find lib/helpers lib/ui -type f -name "*.dart" -print0 | xargs -0 sed "${SED_ARGS[@]}" -e 's/newFeed/newFeedModel/g'
find lib/helpers lib/ui -type f -name "*.dart" -print0 | xargs -0 sed "${SED_ARGS[@]}" -e 's/rssFeedModel/rssFeed/g' -e 's/atomFeedModel/atomFeed/g' -e 's/rss1FeedModel/rss1Feed/g'
