class ReelItemEntity {
  final int id;
  final bool isMine;
  final int roomId;
  final String videoUrl;
  final String previewUrl;
  final String size;
  final String duration;
  final String likesCountTranslated;
  final bool isLiked;

  const ReelItemEntity({
    required this.id,
    required this.isMine,
    required this.roomId,
    required this.videoUrl,
    required this.previewUrl,
    required this.size,
    required this.duration,
    required this.likesCountTranslated,
    required this.isLiked,
  });
}