#!/bin/bash
if [[ "$OSTYPE" == "darwin"* ]]; then
  SED_ARGS=(-i '')
else
  SED_ARGS=(-i)
fi

sed "${SED_ARGS[@]}" -e 's/import '\''package:meread\/ui\/viewmodels\/post\/post_controller.dart'\'';//g' lib/ui/views/home_view.dart
