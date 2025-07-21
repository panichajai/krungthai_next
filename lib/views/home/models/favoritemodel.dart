import 'package:flutter/material.dart';

class Favoritemodel {
  String? title;
  String? image;

  Favoritemodel({this.title, this.image});
}

List<Favoritemodel> favorites = [
  Favoritemodel(title: "Transfer", image: "assets/images/img3.jpg"),
  Favoritemodel(title: "Top Up", image: "assets/images/img2.jpg")
];
