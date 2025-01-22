class ReelDataModel {
  final int id;
  final bool isMine;
  final int roomId;
  final String video;
  final String preview;
  final String size;
  final String duration;
  final int? likesCount;
  final String likesCountTranslated;
  final bool authLikeStatus;

  const ReelDataModel({
    required this.id,
    required this.isMine,
    required this.roomId,
    required this.video,
    required this.preview,
    required this.size,
    required this.duration,
    this.likesCount,
    required this.likesCountTranslated,
    required this.authLikeStatus,
  });

  factory ReelDataModel.fromJson(dynamic json) {
    return ReelDataModel(
      id: json['id'] as int,
      isMine: json['is_mine'] as bool,
      roomId: json['room_id'] as int,
      video: json['video'] as String,
      preview: json['preview'] as String,
      size: json['size'] as String,
      duration: json['duration'] as String,
      likesCountTranslated: json['likes_count_translated'] as String,
      authLikeStatus: json['auth_like_status'] as bool,
    );
  }

}