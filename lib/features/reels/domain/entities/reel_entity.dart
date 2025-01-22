import 'package:reels_task/features/reels/domain/entities/reel_item_entity.dart';
import 'package:reels_task/features/reels/domain/entities/reel_links_entity.dart';
import 'package:reels_task/features/reels/domain/entities/reel_meta_entity.dart';

class ReelEntity {
  final List<ReelItemEntity> items;
  final ReelLinksEntity links;
  final ReelMetaEntity meta;
  final String status;
  final String? message;
  final bool maintenanceMode;

  const ReelEntity({
    required this.items,
    required this.links,
    required this.meta,
    required this.status,
    this.message,
    required this.maintenanceMode,
  });
}