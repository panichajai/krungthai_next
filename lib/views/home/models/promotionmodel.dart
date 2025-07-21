import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PromotionModel {
  final String title;
  final String image;

  PromotionModel({required this.title, required this.image});
}

List<PromotionModel> promotions = [
  PromotionModel(title: "Promotion 1!", image: "assets/images/banner.jpg"),
  PromotionModel(title: "Promotion 2!", image: "assets/images/banner.jpg"),
  PromotionModel(title: "Promotion 3!", image: "assets/images/banner.jpg"),
  PromotionModel(title: "Promotion 4!", image: "assets/images/banner.jpg"),
];
