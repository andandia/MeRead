import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:meread/helpers/db_helper.dart';
import 'package:meread/helpers/resolve_helper.dart';
import 'package:meread/models/feed.dart';

class AddFeedController extends GetxController {
  RxBool isResolved = false.obs;

  final addressController = TextEditingController();
  FeedModel? feed;

  Future<void> pasteAddress() async {
    String? address = (await Clipboard.getData('text/plain'))?.text;
    if (address != null) {
      addressController.text = address;
      addressController.selection = TextSelection.fromPosition(
        TextPosition(offset: address.length),
      );
    }
  }

  Future<void> resolveAddress() async {
    final url = addressController.text;
    feed = await ResolveHelper.parseFeedModel(url);
    if (feed == null) {
      Fluttertoast.showToast(msg: 'feedResolveError'.tr);
    }
    isResolved.value = true;
  }

  Future<bool> isExists() async {
    final url = addressController.text;
    final result = await DbHelper.isExistsFeed(url);
    if (result != null) {
      feed = result;
    }
    return result != null;
  }
}
