import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:meread/helpers/db_helper.dart';
import 'package:meread/models/category.dart';
import 'package:meread/models/feed.dart';

class EditFeedCntroller extends GetxController {
  RxBool fullText = false.obs;
  RxInt openType = 0.obs;
  final titleController = TextEditingController();
  final categoryController = TextEditingController();
  FeedModel? feed;

  void initFeedModel(FeedModel value) {
    fullText.value = value.fullText;
    openType.value = value.openType;
    titleController.text = value.title;
    categoryController.text = value.category.value?.name ?? '';
    feed = value;
  }

  void updateFullText(bool value) {
    fullText.value = value;
  }

  void updateOpenType(int value) {
    openType.value = value;
  }

  Future<void> saveFeedModel() async {
    final newFeedModel = FeedModel(
      id: feed?.id,
      title: titleController.text,
      url: feed?.url ?? '',
      description: feed?.description ?? '',
      fullText: fullText.value,
      openType: openType.value,
    );
    final CategoryModel category =
        await DbHelper.getCategoryByName(categoryController.text) ??
            CategoryModel(
              name: categoryController.text,
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
            );
    newFeedModel.category.value = category;
    DbHelper.saveFeed(newFeedModel);
    Get.back();
  }

  void deleteFeedModel() {
    if (feed == null || feed?.id == null) {
      Get.back();
    } else {
      DbHelper.deleteFeed(feed!);
      Get.back();
    }
  }
}
