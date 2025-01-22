class ReelMetaLinkModel {
  final String? url;
  final String label;
  final bool active;

  const ReelMetaLinkModel({
    this.url,
    required this.label,
    required this.active,
  });

  factory ReelMetaLinkModel.fromJson(Map<String, dynamic> json) {
    return ReelMetaLinkModel(
      url: json['url'] as String?,
      label: json['label'] as String,
      active: json['active'] as bool,
    );
  }
}