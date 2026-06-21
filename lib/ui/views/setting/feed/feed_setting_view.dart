import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meread/ui/viewmodels/setting/feed_setting_controller.dart';

class FeedSettingView extends StatelessWidget {
  const FeedSettingView({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(FeedSettingController());

    return Scaffold(
      appBar: AppBar(
        title: Text('feedSetting'.tr),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Obx(() => ListTile(
                title: Text('pullToRefreshDistance'.tr),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${c.pullToRefreshDistance.value.toInt()}'),
                    Slider(
                      value: c.pullToRefreshDistance.value,
                      min: 10,
                      max: 200,
                      divisions: 190,
                      label: c.pullToRefreshDistance.value.toInt().toString(),
                      onChanged: c.setPullToRefreshDistance,
                    ),
                  ],
                ),
              )),
          const Divider(),
          Obx(() => ListTile(
                title: Text('swipeActionDistance'.tr),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(c.swipeActionDistance.value.toStringAsFixed(2)),
                    Slider(
                      value: c.swipeActionDistance.value,
                      min: 0.1,
                      max: 1.0,
                      divisions: 90,
                      label: c.swipeActionDistance.value.toStringAsFixed(2),
                      onChanged: c.setSwipeActionDistance,
                    ),
                  ],
                ),
              )),
          const Divider(),
          Obx(() => ListTile(
                title: Text('leftSwipeAction'.tr),
                trailing: DropdownButton<int>(
                  value: c.leftSwipeAction.value,
                  onChanged: (int? newValue) {
                    if (newValue != null) {
                      c.setLeftSwipeAction(newValue);
                    }
                  },
                  items: [
                    DropdownMenuItem(value: 0, child: Text('actionToggleRead'.tr)),
                    DropdownMenuItem(value: 1, child: Text('actionToggleFavorite'.tr)),
                    DropdownMenuItem(value: 2, child: Text('actionDelete'.tr)),
                    DropdownMenuItem(value: 3, child: Text('actionNone'.tr)),
                  ],
                ),
              )),
          const Divider(),
          Obx(() => ListTile(
                title: Text('rightSwipeAction'.tr),
                trailing: DropdownButton<int>(
                  value: c.rightSwipeAction.value,
                  onChanged: (int? newValue) {
                    if (newValue != null) {
                      c.setRightSwipeAction(newValue);
                    }
                  },
                  items: [
                    DropdownMenuItem(value: 0, child: Text('actionToggleRead'.tr)),
                    DropdownMenuItem(value: 1, child: Text('actionToggleFavorite'.tr)),
                    DropdownMenuItem(value: 2, child: Text('actionDelete'.tr)),
                    DropdownMenuItem(value: 3, child: Text('actionNone'.tr)),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
