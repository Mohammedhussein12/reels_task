import 'package:reels_task/features/reels/domain/entities/reel_meta_link_entity.dart';

class ReelMetaEntity {
  final int currentPage;
  final int from;
  final int lastPage;
  final List<ReelMetaLinkEntity> paginationLinks;
  final String baseUrl;
  final int itemsPerPage;
  final int to;
  final int totalItems;

  const ReelMetaEntity({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.paginationLinks,
    required this.baseUrl,
    required this.itemsPerPage,
    required this.to,
    required this.totalItems,
  });
}