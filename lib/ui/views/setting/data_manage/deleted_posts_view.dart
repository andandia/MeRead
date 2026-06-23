import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meread/db/database.dart';
import 'package:meread/ui/views/setting/data_manage/deleted_posts_viewmodel.dart';
import 'package:intl/intl.dart';

class DeletedPostsView extends StatelessWidget {
  const DeletedPostsView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Get.put(DeletedPostsViewModel());

    return Scaffold(
      appBar: AppBar(title: Text('deletedPosts'.tr)),
      body: Obx(() {
        if (viewModel.deletedPosts.isEmpty) {
          return Center(child: Text('noDeletedPosts'.tr));
        }

        return ListView.builder(
          itemCount: viewModel.deletedPosts.length,
          itemBuilder: (context, index) {
            final post = viewModel.deletedPosts[index];
            return ListTile(
              title: Text(
                post.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                DateFormat('yyyy-MM-dd HH:mm').format(post.deletedAt),
                style: TextStyle(color: Theme.of(context).colorScheme.outline),
              ),
              onLongPress: () => _showRestoreDialog(context, viewModel, post),
            );
          },
        );
      }),
    );
  }

  void _showRestoreDialog(
    BuildContext context,
    DeletedPostsViewModel viewModel,
    DeletedPost post,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('restorePostTitle'.tr),
          content: Text('restorePostContent'.tr),
          actions: [
            TextButton(onPressed: () => Get.back(), child: Text('cancel'.tr)),
            TextButton(
              onPressed: () {
                viewModel.restorePost(post);
                Get.back();
              },
              child: Text('restore'.tr),
            ),
          ],
        );
      },
    );
  }
}
