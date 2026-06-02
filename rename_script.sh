#!/bin/bash
if [[ "$OSTYPE" == "darwin"* ]]; then
  SED_ARGS=(-i '')
else
  SED_ARGS=(-i)
fi

find lib -type f -name "*.dart" ! -path "lib/models/*" ! -path "lib/db/*" -print0 | xargs -0 sed "${SED_ARGS[@]}" -e 's/Category /CategoryModel /g' -e 's/<Category>/<CategoryModel>/g' -e 's/Category(/CategoryModel(/g'
find lib -type f -name "*.dart" ! -path "lib/models/*" ! -path "lib/db/*" -print0 | xargs -0 sed "${SED_ARGS[@]}" -e 's/Feed /FeedModel /g' -e 's/<Feed>/<FeedModel>/g' -e 's/Feed(/FeedModel(/g'
find lib -type f -name "*.dart" ! -path "lib/models/*" ! -path "lib/db/*" -print0 | xargs -0 sed "${SED_ARGS[@]}" -e 's/Post /PostModel /g' -e 's/<Post>/<PostModel>/g' -e 's/Post(/PostModel(/g'

find lib -type f -name "*.dart" ! -path "lib/models/*" ! -path "lib/db/*" -print0 | xargs -0 sed "${SED_ARGS[@]}" -e 's/List<Category>/List<CategoryModel>/g' -e 's/List<Feed>/List<FeedModel>/g' -e 's/List<Post>/List<PostModel>/g'
find lib -type f -name "*.dart" ! -path "lib/models/*" ! -path "lib/db/*" -print0 | xargs -0 sed "${SED_ARGS[@]}" -e 's/Category?/CategoryModel?/g' -e 's/Feed?/FeedModel?/g' -e 's/Post?/PostModel?/g'
find lib -type f -name "*.dart" ! -path "lib/models/*" ! -path "lib/db/*" -print0 | xargs -0 sed "${SED_ARGS[@]}" -e 's/Category>/CategoryModel>/g' -e 's/Feed>/FeedModel>/g' -e 's/Post>/PostModel>/g'
