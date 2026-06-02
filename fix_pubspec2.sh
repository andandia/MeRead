#!/bin/bash
if [[ "$OSTYPE" == "darwin"* ]]; then
  SED_ARGS=(-i '')
else
  SED_ARGS=(-i)
fi

sed "${SED_ARGS[@]}" -e 's/sdk: "\>=2.18.0 <3.0.0"/sdk: "\>=3.0.0 <4.0.0"/g' pubspec.yaml
