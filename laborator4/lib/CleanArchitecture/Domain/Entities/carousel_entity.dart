class CarouselEntity {
  final String name;
  final String image;
  final int criticScore;
  final String bottleSize;
  final double priceUsd;
  final String type;
  final Location from;

  CarouselEntity({
    required this.name,
    required this.image,
    required this.criticScore,
    required this.bottleSize,
    required this.priceUsd,
    required this.type,
    required this.from,
  });

  factory CarouselEntity.fromJson(Map<String, dynamic> json) {
    return CarouselEntity(
      name: json['name'],
      image: json['image'],
      criticScore: json['critic_score'],
      bottleSize: json['bottle_size'],
      priceUsd: json['price_usd'].toDouble(),
      type: json['type'],
      from: Location.fromJson(json['from']),
    );
  }
}

class Location {
  final String country;
  final String city;

  Location({required this.country, required this.city});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      country: json['country'],
      city: json['city'],
    );
  }
}
