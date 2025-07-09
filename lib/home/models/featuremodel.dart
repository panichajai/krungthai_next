import 'package:flutter/material.dart';

class FeatureModel {
  String? title;
  IconData? icon;

  FeatureModel({this.title, this.icon});
}

List<FeatureModel> features = [
  FeatureModel(title: "Transfer", icon: Icons.credit_card),
  FeatureModel(title: "Funds", icon: Icons.credit_card),
  FeatureModel(title: "Top Up", icon: Icons.credit_card),
  FeatureModel(title: "Insurance", icon: Icons.credit_card),
  FeatureModel(title: "Pay Bills", icon: Icons.credit_card),
  FeatureModel(title: "Loan", icon: Icons.credit_card),
  FeatureModel(title: "ATM", icon: Icons.credit_card),
  FeatureModel(title: "More", icon: Icons.more_horiz),
  FeatureModel(title: "More", icon: Icons.more_horiz),
  FeatureModel(title: "More", icon: Icons.more_horiz),
];
