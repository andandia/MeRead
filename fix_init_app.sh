#!/bin/bash
if [[ "$OSTYPE" == "darwin"* ]]; then
  SED_ARGS=(-i '')
else
  SED_ARGS=(-i)
fi

sed "${SED_ARGS[@]}" -e 's/import '\''package:meread\/helpers\/isar_helper.dart'\'';/import '\''package:meread\/helpers\/db_helper.dart'\'';/g' lib/common/init_app.dart
sed "${SED_ARGS[@]}" -e 's/IsarHelper/DbHelper/g' lib/common/init_app.dart
