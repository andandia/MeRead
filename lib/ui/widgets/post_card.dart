import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meread/models/post.dart';

class PostCard extends StatelessWidget {
  final PostModel post;
  const PostCard({super.key, required this.post});

  Color _getRandomColor(int? id, String title) {
    final int hash = id != null ? id.hashCode : title.hashCode;
    final List<Color> colors = [
      Colors.redAccent,
      Colors.blueAccent,
      Colors.greenAccent,
      Colors.orangeAccent,
      Colors.purpleAccent,
      Colors.tealAccent,
      Colors.pinkAccent,
      Colors.amberAccent,
    ];
    return colors[hash % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Get.theme.colorScheme.secondaryContainer
            .withAlpha(post.read ? 20 : 60),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 4, bottom: 8),
                height: 4,
                width: constraints.maxWidth * 0.1,
                decoration: BoxDecoration(
                  color: _getRandomColor(post.id, post.title).withAlpha(post.read ? 120 : 255),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Text(
                post.title,
                style: TextStyle(
                  fontSize: 16,
                  color: post.read
                      ? Theme.of(context).colorScheme.outline.withAlpha(150)
                      : null,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                post.content,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13,
                  color: Theme.of(context).colorScheme.outline.withAlpha(
                        post.read ? 120 : 255,
                      ),
                ),
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    post.feed.value?.title ?? '',
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.secondary.withAlpha(
                            post.read ? 120 : 255,
                          ),
                    ),
                  ),
                  const Spacer(),
                  if (post.favorite)
                    Container(
                      width: 24,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Theme.of(context).colorScheme.primaryContainer,
                      ),
                      child: Icon(
                        Icons.bookmark_rounded,
                        size: 16,
                        color: Theme.of(context).colorScheme.secondary.withAlpha(
                              post.read ? 120 : 255,
                            ),
                      ),
                    ),
                  const SizedBox(width: 8),
                  Text(
                    post.pubDate.toLocal().toString().substring(0, 16),
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.secondary.withAlpha(
                            post.read ? 120 : 255,
                          ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
