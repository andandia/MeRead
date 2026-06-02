#!/bin/bash
if [[ "$OSTYPE" == "darwin"* ]]; then
  SED_ARGS=(-i '')
else
  SED_ARGS=(-i)
fi

sed "${SED_ARGS[@]}" -e 's/ as db.Post//g' lib/helpers/db_helper.dart
sed "${SED_ARGS[@]}" -e 's/ as db.Category//g' lib/helpers/db_helper.dart
