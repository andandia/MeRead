import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:get/get.dart';
import 'package:meread/helpers/db_helper.dart';
import 'package:meread/helpers/prefs_helper.dart';
import 'package:meread/models/category.dart';
import 'package:meread/models/post.dart';
import 'package:meread/ui/viewmodels/home_controller.dart';

import 'package:meread/ui/widgets/feed_panel.dart';
import 'package:meread/ui/widgets/post_card.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<RefreshIndicatorState> _refreshKey = GlobalKey();
  final c = Get.put(HomeController());
  bool _isFabOpen = false;

  @override
  void initState() {
    super.initState();
    if (PrefsHelper.refreshOnStartup) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _refreshKey.currentState?.show();
      });
    }
  }

  void _toggleFab() {
    setState(() {
      _isFabOpen = !_isFabOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text(
                c.appBarTitle.value,
              ),
            )),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: c.filterUnread,
            icon: Obx(() => c.onlyUnread.value
                ? const Icon(Icons.radio_button_checked)
                : const Icon(Icons.radio_button_unchecked)),
          ),
          IconButton(
            onPressed: c.filterFavorite,
            icon: Obx(() => c.onlyFavorite.value
                ? const Icon(Icons.bookmark)
                : const Icon(Icons.bookmark_border_outlined)),
          ),
          PopupMenuButton(
            elevation: 1,
            position: PopupMenuPosition.under,
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry>[
                PopupMenuItem(
                  onTap: c.markAllRead,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.done_all_outlined, size: 20),
                      const SizedBox(width: 10),
                      Text('markAllAsRead'.tr),
                    ],
                  ),
                ),
                const PopupMenuDivider(),
                PopupMenuItem(
                  child: SearchAnchor(
                    isFullScreen: true,
                    searchController: c.searchController,
                    builder: (context, controller) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(Icons.search_outlined, size: 20),
                          const SizedBox(width: 10),
                          Text('fullTextSearch'.tr),
                        ],
                      );
                    },
                    suggestionsBuilder: (BuildContext context,
                        SearchController controller) async {
                      List<PostModel> results =
                          await DbHelper.search(controller.text);
                      return results
                          .map((e) => Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 4),
                                child: PostCard(post: e),
                              ))
                          .toList();
                    },
                  ),
                ),
                PopupMenuItem(
                  onTap: c.toAddFeedModel,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.add_outlined, size: 20),
                      const SizedBox(width: 10),
                      Text('addFeed'.tr),
                    ],
                  ),
                ),
                const PopupMenuDivider(),
                PopupMenuItem(
                  onTap: c.toSetting,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.settings_outlined, size: 20),
                      const SizedBox(width: 10),
                      Text('moreSetting'.tr),
                    ],
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      body: SafeArea(
        child: RefreshIndicator(
          key: _refreshKey,
          displacement: PrefsHelper.pullToRefreshDistance,
          onRefresh: c.refreshPosts,
          child: Obx(
            () => ListView.separated(
              physics: c.postList.isEmpty
                  ? const AlwaysScrollableScrollPhysics()
                  : const BouncingScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(12, 4, 12, 12),
              itemBuilder: (context, index) {
                final post = c.postList[index];

                SwipeAction buildSwipeAction(int actionType) {
                  IconData iconData;
                  if (actionType == 0) {
                    iconData = post.read ? Icons.remove_done : Icons.done_outline_rounded;
                  } else if (actionType == 1) {
                    iconData = post.favorite ? Icons.bookmark_remove : Icons.bookmark_add_outlined;
                  } else if (actionType == 2) {
                    iconData = Icons.delete_outline;
                  } else {
                    iconData = Icons.not_interested; // fallback
                  }

                  return SwipeAction(
                    color: Colors.transparent,
                    content: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Theme.of(context).colorScheme.secondaryContainer,
                      ),
                      child: Icon(
                        iconData,
                        color: Theme.of(context).colorScheme.onSecondaryContainer,
                      ),
                    ),
                    onTap: (handler) async {
                      if (actionType == 0) {
                        c.updateReadStatus(post);
                        c.getUnreadCount();
                        await handler(false);
                      } else if (actionType == 1) {
                        c.updateFavoriteStatus(post);
                        await handler(false);
                      } else if (actionType == 2) {
                        c.deletePost(post);
                        await handler(true);
                      } else {
                        await handler(false);
                      }
                    },
                  );
                }

                List<SwipeAction> trailingActions = [];
                if (PrefsHelper.leftSwipeAction != 3) {
                  trailingActions.add(buildSwipeAction(PrefsHelper.leftSwipeAction));
                }

                List<SwipeAction> leadingActions = [];
                if (PrefsHelper.rightSwipeAction != 3) {
                  leadingActions.add(buildSwipeAction(PrefsHelper.rightSwipeAction));
                }

                return SwipeActionCell(
                  key: ObjectKey(post),
                  fullSwipeFactor: PrefsHelper.swipeActionDistance,
                  trailingActions: trailingActions,
                  leadingActions: leadingActions,
                  child: InkWell(
                    onTap: () {
                      if (post.feed.value?.openType == 0) {
                        Get.toNamed('/post', arguments: post)!
                            .then((_) {
                          c.getPosts();
                          c.getUnreadCount();
                        });
                      } else if (post.feed.value?.openType == 1) {
                        launchUrlString(
                          post.link,
                          mode: LaunchMode.inAppBrowserView,
                        );
                      } else if (post.feed.value?.openType == 2) {
                        launchUrlString(
                          post.link,
                          mode: LaunchMode.externalApplication,
                        );
                      } else {
                        Get.toNamed('/post', arguments: post)!
                            .then((_) {
                          c.getPosts();
                          c.getUnreadCount();
                        });
                      }
                    },
                    child: PostCard(post: post),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemCount: c.postList.length,
            ),
          ),
        ),
      ),
      drawerEdgeDragWidth: Get.width * 0.3,
      drawer: Drawer(
        child: SafeArea(
          child: Obx(
            () => ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 12),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
                  child: ListTile(
                    title: Text('allFeeds'.tr),
                    onTap: c.focusAllFeeds,
                    tileColor: Theme.of(context)
                        .colorScheme
                        .secondaryContainer
                        .withAlpha(100),
                    visualDensity: VisualDensity.compact,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                ),
                for (CategoryModel category in c.categorys)
                  FeedPanel(
                    category: category,
                    categoryOnTap: (CategoryModel cat) => c.focusCategoryModel(cat),
                    feedOnTap: (feed) => c.focusFeedModel(feed),
                    feedOnLongPress: (feed) => c.toEditFeedModel(feed),
                  ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (_isFabOpen) ...[
            FloatingActionButton.extended(
              heroTag: 'markAllRead',
              onPressed: () {
                c.markAllRead();
                _toggleFab();
              },
              label: Text('markAllAsRead'.tr),
              icon: const Icon(Icons.done_all_outlined),
            ),
            const SizedBox(height: 16),
            FloatingActionButton.extended(
              heroTag: 'selectFeed',
              onPressed: () {
                _toggleFab();
                _showFeedSelectionModal(context);
              },
              label: Text('allFeeds'.tr),
              icon: const Icon(Icons.list),
            ),
            const SizedBox(height: 16),
          ],
          FloatingActionButton(
            heroTag: 'mainFab',
            onPressed: _toggleFab,
            child: Icon(_isFabOpen ? Icons.close : Icons.menu),
          ),
        ],
      ),
    );
  }

  void _showFeedSelectionModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.7,
              maxWidth: MediaQuery.of(context).size.width * 0.9,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'allFeeds'.tr,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Divider(height: 1),
                Expanded(
                  child: Obx(
                    () => ListView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      children: [
                        ListTile(
                          title: Text('allFeeds'.tr),
                          onTap: () {
                            c.focusAllFeeds();
                            Navigator.of(context).pop();
                          },
                        ),
                        for (CategoryModel category in c.categorys)
                          FeedPanel(
                            category: category,
                            categoryOnTap: (CategoryModel cat) {
                              c.focusCategoryModel(cat);
                              Navigator.of(context).pop();
                            },
                            feedOnTap: (feed) {
                              c.focusFeedModel(feed);
                              Navigator.of(context).pop();
                            },
                            feedOnLongPress: (feed) => c.toEditFeedModel(feed),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
