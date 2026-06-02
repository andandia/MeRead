#!/bin/bash
if [[ "$OSTYPE" == "darwin"* ]]; then
  SED_ARGS=(-i '')
else
  SED_ARGS=(-i)
fi

find lib/helpers lib/ui -type f -name "*.dart" -print0 | xargs -0 sed "${SED_ARGS[@]}" -e 's/IsarHelper/DbHelper/g'
find lib/helpers lib/ui -type f -name "*.dart" -print0 | xargs -0 sed "${SED_ARGS[@]}" -e 's/isar_helper.dart/db_helper.dart/g'
