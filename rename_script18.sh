#!/bin/bash
if [[ "$OSTYPE" == "darwin"* ]]; then
  SED_ARGS=(-i '')
else
  SED_ARGS=(-i)
fi

find lib/helpers -type f -name "db_helper.dart" -print0 | xargs -0 sed "${SED_ARGS[@]}" -e 's/await _db\.deleteFeedModel(feedModel);/await _db.deleteFeedModel(db.Feed(id: feedModel.id!, categoryId: feedModel.category.value?.id, title: feedModel.title, url: feedModel.url, description: feedModel.description, fullText: feedModel.fullText, openType: feedModel.openType));/g'
find lib/helpers -type f -name "db_helper.dart" -print0 | xargs -0 sed "${SED_ARGS[@]}" -e 's/await _db\.updatePostRead(postModel, postModel\.read);/await _db.updatePostRead(db.Post(id: postModel.id!, feedId: postModel.feed.value?.id, title: postModel.title, link: postModel.link, content: postModel.content, pubDate: postModel.pubDate, read: postModel.read, favorite: postModel.favorite, fullText: postModel.fullText), postModel.read);/g'
find lib/helpers -type f -name "db_helper.dart" -print0 | xargs -0 sed "${SED_ARGS[@]}" -e 's/List<post_model\.PostModel> posts =/List<db.Post> posts =/g'
find lib/helpers -type f -name "db_helper.dart" -print0 | xargs -0 sed "${SED_ARGS[@]}" -e 's/return pm;/return db.Post(id: pm.id!, feedId: pm.feed.value?.id, title: pm.title, link: pm.link, content: pm.content, pubDate: pm.pubDate, read: pm.read, favorite: pm.favorite, fullText: pm.fullText);/g'
