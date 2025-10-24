

import 'package:optex_app/domain/profile/entities/plan.dart';

class PlanModel extends Plan {
  PlanModel({
    required int id,
    required String name,
    required double price,
    required List<String> features,
  }) : super(id: id, name: name, price: price, features: features);

  factory PlanModel.fromJson(Map<String, dynamic> json) {
    return PlanModel(
      id: json['id'],
      name: json['name'],
      price: (json['price'] as num).toDouble(),
      features: List<String>.from(json['features']),
    );
  }
}
