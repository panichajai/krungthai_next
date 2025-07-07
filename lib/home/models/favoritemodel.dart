import 'package:flutter/material.dart';

class Favoritemodel {
  String? title;
  IconData? icon;

  Favoritemodel({this.title, this.icon});
}

List<Favoritemodel> favorites = [
  Favoritemodel(title: "Transfer", icon: Icons.person),
  Favoritemodel(title: "Top Up", icon: Icons.add)
];
