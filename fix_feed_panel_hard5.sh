#!/bin/bash
cat << 'INNER_EOF' > lib/ui/widgets/feed_panel.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meread/models/category.dart';
import 'package:meread/models/feed.dart';

class FeedPanel extends StatefulWidget {
  final CategoryModel category;
  final Function(CategoryModel category)? categoryOnTap;
  final Function(FeedModel feed) feedOnTap;
  final Function(FeedModel feed) feedOnLongPress;

  const FeedPanel({
    super.key,
    required this.category,
    this.categoryOnTap,
    required this.feedOnTap,
    required this.feedOnLongPress,
  });

  @override
  State<FeedPanel> createState() => _FeedPanelState();
}

class _FeedPanelState extends State<FeedPanel> {
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            widget.category.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: Icon(
            isExpanded ? Icons.expand_less : Icons.expand_more,
          ),
          onTap: () {
            if (widget.categoryOnTap != null) {
              widget.categoryOnTap!(widget.category);
            }
            setState(() {
              isExpanded = !isExpanded;
            });
          },
        ),
        AnimatedCrossFade(
          firstChild: Container(),
          secondChild: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: widget.category.feeds.isEmpty
                ? const SizedBox.shrink()
                : Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Get.theme.colorScheme.secondaryContainer
                          .withAlpha(100),
                    ),
                    child: Column(
                      children: widget.category.feeds.toList()
                          .map<Widget>((feedModel) {
                              final feed = feedModel as FeedModel;
                              return ListTile(
                                title: Text(feed.title),
                                dense: true,
                                visualDensity: VisualDensity.compact,
                                onTap: () => widget.feedOnTap(feed),
                                onLongPress: () =>
                                    widget.feedOnLongPress(feed),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                              );
                          })
                          .toList(),
                    ),
                  ),
          ),
          crossFadeState: isExpanded
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 300),
        ),
      ],
    );
  }
}
INNER_EOF
