#!/bin/bash
if [[ "$OSTYPE" == "darwin"* ]]; then
  SED_ARGS=(-i '')
else
  SED_ARGS=(-i)
fi

find lib/helpers lib/ui -type f -name "*.dart" -print0 | xargs -0 sed "${SED_ARGS[@]}" -e 's/RssFeedModel/RssFeed/g' -e 's/AtomFeedModel/AtomFeed/g' -e 's/Rss1FeedModel/Rss1Feed/g'
find lib/helpers lib/ui -type f -name "*.dart" -print0 | xargs -0 sed "${SED_ARGS[@]}" -e 's/FeedModelModel/FeedModel/g' -e 's/PostModelModel/PostModel/g' -e 's/CategoryModelModel/CategoryModel/g'
