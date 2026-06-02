#!/bin/bash
if [[ "$OSTYPE" == "darwin"* ]]; then
  SED_ARGS=(-i '')
else
  SED_ARGS=(-i)
fi

find lib/helpers lib/ui -type f -name "*.dart" -print0 | xargs -0 sed "${SED_ARGS[@]}" -e 's/Map<Feed, int>/Map<FeedModel, int>/g' -e 's/RxMap<Feed, int>/RxMap<FeedModel, int>/g' -e 's/List<Feed>/List<FeedModel>/g'
