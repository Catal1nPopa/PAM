class WinesEntity {
  final String tag;
  final String name;

  WinesEntity({required this.tag, required this.name});

  factory WinesEntity.fromJson(Map<String, dynamic> json) {
    return WinesEntity(
      tag: json['tag'],
      name: json['name'],
    );
  }
}
