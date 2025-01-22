import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reels_task/features/reels/domain/entities/reel_item_entity.dart';
import 'package:reels_task/features/reels/presentation/widgets/video_player_widget.dart';

class ReelItem extends StatelessWidget {
  final ReelItemEntity reel;

  const ReelItem({
    required this.reel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Stack(
        fit: StackFit.expand,
        children: [
          VideoPlayerWidget(
            videoUrl: reel.videoUrl,
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Duration: ${reel.duration}',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
