import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BannerModel {
  final String title;
  final String image;

  BannerModel({required this.title, required this.image});
}

List<BannerModel> banners = [
  BannerModel(
      title: "Live Life to the NEXT", image: "assets/images/banner.jpg"),
  BannerModel(
      title: "Live Life to the NEXT", image: "assets/images/banner.jpg"),
];
