#!/bin/bash
if [[ "$OSTYPE" == "darwin"* ]]; then
  SED_ARGS=(-i '')
else
  SED_ARGS=(-i)
fi

sed "${SED_ARGS[@]}" -e '1s/^/\/\/ @dart=3.0\n/' lib/db/database.dart
sed "${SED_ARGS[@]}" -e '1s/^/\/\/ @dart=3.0\n/' lib/db/tables.dart
