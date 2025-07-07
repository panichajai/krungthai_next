import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BannerModel {
  final String title;
  final Color color;

  BannerModel({required this.title, required this.color});
}

List<BannerModel> banners = [
  BannerModel(title: "Live Life to the NEXT", color: Colors.blue),
  BannerModel(title: "Live Life to the NEXT 2!", color: Colors.green),
  BannerModel(title: "Live Life to the NEXT 3!", color: Colors.orange),
  BannerModel(title: "Live Life to the NEXT 4!", color: Colors.purple),
];
