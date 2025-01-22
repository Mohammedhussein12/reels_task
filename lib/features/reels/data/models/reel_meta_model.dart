import 'package:reels_task/features/reels/data/models/reel_meta_link_model.dart';

class ReelMetaModel {
  final int currentPage;
  final int from;
  final int lastPage;
  final List<ReelMetaLinkModel> links;
  final String path;
  final int perPage;
  final int to;
  final int total;

  const ReelMetaModel({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.links,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });

  factory ReelMetaModel.fromJson(Map<String, dynamic> json) {
    return ReelMetaModel(
      currentPage: json['current_page'] as int,
      from: json['from'] as int,
      lastPage: json['last_page'] as int,
      links: (json['links'] as List<dynamic>)
          .map((e) => ReelMetaLinkModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      path: json['path'] as String,
      perPage: json['per_page'] as int,
      to: json['to'] as int,
      total: json['total'] as int,
    );
  }
}