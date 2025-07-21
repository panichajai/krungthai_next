import 'package:flutter/material.dart';

class FeatureModel {
  String? title;
  String? image;

  FeatureModel({this.title, this.image});
}

List<FeatureModel> features = [
  FeatureModel(title: "Transfer", image: "assets/images/img1.jpg"),
  FeatureModel(title: "Funds", image: "assets/images/img2.jpg"),
  FeatureModel(title: "Top Up", image: "assets/images/img3.jpg"),
  FeatureModel(title: "Insurance", image: "assets/images/img1.jpg"),
  FeatureModel(title: "Pay Bills", image: "assets/images/img2.jpg"),
  FeatureModel(title: "Loan", image: "assets/images/img3.jpg"),
  FeatureModel(title: "ATM", image: "assets/images/img1.jpg"),
  FeatureModel(title: "More", image: "assets/images/img2.jpg"),
  FeatureModel(title: "More", image: "assets/images/img3.jpg"),
  FeatureModel(title: "More", image: "assets/images/img1.jpg"),
];
