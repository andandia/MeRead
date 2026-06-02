#!/bin/bash
if [[ "$OSTYPE" == "darwin"* ]]; then
  SED_ARGS=(-i '')
else
  SED_ARGS=(-i)
fi

sed "${SED_ARGS[@]}" -e 's/import '\''package:meread\/helpers\/isar_helper.dart'\'';//g' lib/common/init_app.dart
