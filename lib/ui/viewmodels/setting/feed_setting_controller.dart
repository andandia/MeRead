import 'package:get/get.dart';
import 'package:meread/helpers/prefs_helper.dart';

class FeedSettingController extends GetxController {
  final pullToRefreshDistance = PrefsHelper.pullToRefreshDistance.obs;
  final swipeActionDistance = PrefsHelper.swipeActionDistance.obs;

  void setPullToRefreshDistance(double value) {
    pullToRefreshDistance.value = value;
    PrefsHelper.pullToRefreshDistance = value;
  }

  void setSwipeActionDistance(double value) {
    swipeActionDistance.value = value;
    PrefsHelper.swipeActionDistance = value;
  }

  final leftSwipeAction = PrefsHelper.leftSwipeAction.obs;
  final rightSwipeAction = PrefsHelper.rightSwipeAction.obs;

  void setLeftSwipeAction(int value) {
    leftSwipeAction.value = value;
    PrefsHelper.leftSwipeAction = value;
  }

  void setRightSwipeAction(int value) {
    rightSwipeAction.value = value;
    PrefsHelper.rightSwipeAction = value;
  }
}
