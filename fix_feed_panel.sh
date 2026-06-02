#!/bin/bash
if [[ "$OSTYPE" == "darwin"* ]]; then
  SED_ARGS=(-i '')
else
  SED_ARGS=(-i)
fi

sed "${SED_ARGS[@]}" -e 's/\.map<Widget>((dynamic f) { final feed = f as FeedModel; return ListTile(/.map<Widget>((feed) => ListTile(/g' lib/ui/widgets/feed_panel.dart
sed "${SED_ARGS[@]}" -e 's/widget.feedOnLongPress(feed); }),/widget.feedOnLongPress(feed),/g' lib/ui/widgets/feed_panel.dart
sed "${SED_ARGS[@]}" -e 's/widget.category.feeds.toList()/widget.category.feeds.toList()/g' lib/ui/widgets/feed_panel.dart
sed "${SED_ARGS[@]}" -e 's/\.map<Widget>((feed) => ListTile/\.map<Widget>((feed) => ListTile/g' lib/ui/widgets/feed_panel.dart
