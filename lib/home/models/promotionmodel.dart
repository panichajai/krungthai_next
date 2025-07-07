import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PromotionModel {
  final String title;
  final Color color;

  PromotionModel({required this.title, required this.color});
}

List<PromotionModel> promotions = [
  PromotionModel(title: "Promotion 1!", color: Colors.blue),
  PromotionModel(title: "Promotion 2!", color: Colors.green),
  PromotionModel(title: "Promotion 3!", color: Colors.orange),
  PromotionModel(title: "Promotion 4!", color: Colors.purple),
];
