class ReelLinksModel {
  final String? first;
  final String? last;
  final String? prev;
  final String? next;

  const ReelLinksModel({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  factory ReelLinksModel.fromJson(Map<String, dynamic> json) {
    return ReelLinksModel(
      first: json['first'] as String?,
      last: json['last'] as String?,
      prev: json['prev'] as String?,
      next: json['next'] as String?,
    );
  }
}