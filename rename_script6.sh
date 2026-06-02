#!/bin/bash
if [[ "$OSTYPE" == "darwin"* ]]; then
  SED_ARGS=(-i '')
else
  SED_ARGS=(-i)
fi

find lib/ui/viewmodels -type f -name "edit_feed_controller.dart" -print0 | xargs -0 sed "${SED_ARGS[@]}" -e 's/newFeedModelModel/newFeedModel/g'
find lib/ui/viewmodels -type f -name "home_controller.dart" -print0 | xargs -0 sed "${SED_ARGS[@]}" -e 's/Map<Feed, int>/Map<FeedModel, int>/g' -e 's/RxMap<Feed, int>/RxMap<FeedModel, int>/g'
find lib/ui/views -type f -name "edit_feed_view.dart" -print0 | xargs -0 sed "${SED_ARGS[@]}" -e 's/saveFeed/saveFeedModel/g' -e 's/deleteFeed/deleteFeedModel/g'
find lib/ui/views -type f -name "home_view.dart" -print0 | xargs -0 sed "${SED_ARGS[@]}" -e 's/toAddFeed/toAddFeedModel/g'
find lib/ui/widgets -type f -name "feed_panel.dart" -print0 | xargs -0 sed "${SED_ARGS[@]}" -e 's/feeds.map/feeds.toList().map/g'
