class CarouselEntity {
  final String name;
  final String image;
  final int criticScore;
  final String bottleSize;
  final double priceUsd;
  final String type;
  final Location from;
  final String cantitate;

  CarouselEntity({
    required this.name,
    required this.image,
    required this.criticScore,
    required this.bottleSize,
    required this.priceUsd,
    required this.type,
    required this.from,
    required this.cantitate,
  });

  // Factory constructor for creating a CarouselEntity from JSON
  factory CarouselEntity.fromJson(Map<String, dynamic> json) {
    return CarouselEntity(
      name: json['name'] ?? 'Unnamed Wine', // Provide default values
      image: json['image'] ?? '',
      cantitate: json['cantitate'] ?? '',
      criticScore: json['critic_score'] ?? 0,
      bottleSize: json['bottle_size'] ?? 'Unknown Size',
      priceUsd: (json['price_usd'] as num?)?.toDouble() ?? 0.0,
      type: json['type'] ?? 'Unknown Type',
      from: Location.fromJson(json['from'] ?? {}),
    );
  }
}

class Location {
  final String country;
  final String city;

  Location({required this.country, required this.city});

  // Factory constructor for creating a Location from JSON
  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      country: json['country'] ?? 'Unknown Country', // Provide default values
      city: json['city'] ?? 'Unknown City',
    );
  }
}
