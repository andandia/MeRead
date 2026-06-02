#!/bin/bash
if [[ "$OSTYPE" == "darwin"* ]]; then
  SED_ARGS=(-i '')
else
  SED_ARGS=(-i)
fi

find lib/ui/viewmodels -type f -name "home_controller.dart" -print0 | xargs -0 sed "${SED_ARGS[@]}" -e 's/RxMap<FeedModel, int>/RxMap<FeedModel, int>/g' # this was fine actually, error is on another line
find lib/ui/viewmodels -type f -name "home_controller.dart" -print0 | xargs -0 sed "${SED_ARGS[@]}" -e 's/Map<FeedModel, int> result = {};/Map<FeedModel, int> result = {};/g'
