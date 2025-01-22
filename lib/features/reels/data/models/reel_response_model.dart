import 'package:reels_task/features/reels/data/models/reel_data_model.dart';
import 'package:reels_task/features/reels/data/models/reel_links_model.dart';
import 'package:reels_task/features/reels/data/models/reel_meta_model.dart';

class ReelResponseModel {
  final List<ReelDataModel> data;
  final ReelLinksModel links;
  final ReelMetaModel meta;
  final String status;
  final String? message;
  final bool maintenanceMode;

  const ReelResponseModel({
    required this.data,
    required this.links,
    required this.meta,
    required this.status,
    this.message,
    required this.maintenanceMode,
  });

  factory ReelResponseModel.fromJson(Map<String, dynamic> json) {
    return ReelResponseModel(
      data: (json['data'] as List<dynamic>)
          .map((e) => ReelDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: ReelLinksModel.fromJson(json['links'] as Map<String, dynamic>),
      meta: ReelMetaModel.fromJson(json['meta'] as Map<String, dynamic>),
      status: json['status'] as String,
      message: json['message'] as String?,
      maintenanceMode: json['maintenance_mode'] as bool,
    );
  }
}
