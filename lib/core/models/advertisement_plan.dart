class AdvertisementPlan {
  final int id;
  final String title;
  final String description;
  final double price;
  final int duration;
  final bool isPopular;
  final List<String> features;

  AdvertisementPlan({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.duration,
    this.isPopular = false,
    required this.features,
  });

  factory AdvertisementPlan.fromJson(Map<String, dynamic> json) {
    return AdvertisementPlan(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] ?? 0.0).toDouble(),
      duration: json['duration'] ?? 30,
      isPopular: json['is_popular'] ?? false,
      features: List<String>.from(json['features'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'duration': duration,
      'is_popular': isPopular,
      'features': features,
    };
  }
}