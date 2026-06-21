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
        ],
      ),
    );
  }
}
