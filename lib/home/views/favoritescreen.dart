import 'package:flutter/material.dart';
import 'package:krungthai_next/home/models/favoritemodel.dart';
import 'package:krungthai_next/home/models/featuremodel.dart';
import 'package:krungthai_next/home/views/homescreen.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FavoriteScreen")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final favorite = favorites[index];
                return Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: FeatureIcon(
                    title: favorite.title ?? "",
                    icon: favorite.icon ?? Icons.help_outline,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
