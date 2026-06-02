#!/bin/bash
if [[ "$OSTYPE" == "darwin"* ]]; then
  SED_ARGS=(-i '')
else
  SED_ARGS=(-i)
fi

sed "${SED_ARGS[@]}" -e 's/categoryOnTap: () => c\.focusCategoryModel(category),/categoryOnTap: (CategoryModel cat) => c.focusCategoryModel(cat),/g' lib/ui/views/home_view.dart
