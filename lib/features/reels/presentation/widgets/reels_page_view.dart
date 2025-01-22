import 'package:flutter/material.dart';
import 'package:reels_task/features/reels/domain/entities/reel_item_entity.dart';
import 'package:reels_task/features/reels/presentation/widgets/reel_item.dart';

class ReelsPageView extends StatefulWidget {
  final List<ReelItemEntity> reels;

  const ReelsPageView({required this.reels, super.key});

  @override
  State<ReelsPageView> createState() => _ReelsPageViewState();
}

class _ReelsPageViewState extends State<ReelsPageView> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      controller: _pageController,
      itemCount: widget.reels.length,
      onPageChanged: (index) {
        setState(() => _currentPage = index);
      },
      itemBuilder: (context, index) {
        return ReelItem(
          reel: widget.reels[index],
        );
      },
    );
  }
}