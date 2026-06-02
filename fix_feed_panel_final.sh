#!/bin/bash
if [[ "$OSTYPE" == "darwin"* ]]; then
  SED_ARGS=(-i '')
else
  SED_ARGS=(-i)
fi

sed "${SED_ARGS[@]}" -e 's/final feed = feedModel as FeedModel;/final feed = feedModel;/g' lib/ui/widgets/feed_panel.dart
