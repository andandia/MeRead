import 'package:get/get.dart';
import 'package:meread/db/database.dart';
import 'package:meread/helpers/db_helper.dart';
import 'package:meread/helpers/log_helper.dart';

class DeletedPostsViewModel extends GetxController {
  final deletedPosts = <DeletedPost>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadDeletedPosts();
  }

  Future<void> _loadDeletedPosts() async {
    try {
      final posts = await DbHelper.getDeletedPosts();
      deletedPosts.value = posts;
    } catch (e) {
      LogHelper.e('Failed to load deleted posts: $e');
    }
  }

  Future<void> restorePost(DeletedPost post) async {
    try {
      await DbHelper.removeDeletedPost(post.link);
      deletedPosts.remove(post);
    } catch (e) {
      LogHelper.e('Failed to restore post: $e');
    }
  }
}
