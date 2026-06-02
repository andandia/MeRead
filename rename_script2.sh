#!/bin/bash
if [[ "$OSTYPE" == "darwin"* ]]; then
  SED_ARGS=(-i '')
else
  SED_ARGS=(-i)
fi

find lib/ui -type f -name "*.dart" -print0 | xargs -0 sed "${SED_ARGS[@]}" -e 's/Feed /FeedModel /g' -e 's/<Feed>/<FeedModel>/g' -e 's/Feed(/FeedModel(/g'
find lib/helpers -type f -name "*.dart" -print0 | xargs -0 sed "${SED_ARGS[@]}" -e 's/Feed /FeedModel /g' -e 's/<Feed>/<FeedModel>/g' -e 's/Feed(/FeedModel(/g'

find lib/ui -type f -name "*.dart" -print0 | xargs -0 sed "${SED_ARGS[@]}" -e 's/Post /PostModel /g' -e 's/<Post>/<PostModel>/g' -e 's/Post(/PostModel(/g'
find lib/helpers -type f -name "*.dart" -print0 | xargs -0 sed "${SED_ARGS[@]}" -e 's/Post /PostModel /g' -e 's/<Post>/<PostModel>/g' -e 's/Post(/PostModel(/g'
