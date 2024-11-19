class WinesEntity {
  final String tag;
  final String name;

  WinesEntity({
    required this.tag,
    required this.name,
  });

  // Factory constructor for creating a WinesEntity from JSON
  factory WinesEntity.fromJson(Map<String, dynamic> json) {
    return WinesEntity(
      tag: json['tag'] ?? 'Unknown Tag', // Provide default values
      name: json['name'] ?? 'Unknown Name',
    );
  }
}
