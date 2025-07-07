import 'package:flutter/material.dart';
import 'package:krungthai_next/home/models/featuremodel.dart';
import 'package:krungthai_next/home/view/homescreen.dart';

class FeatureScreen extends StatelessWidget {
  const FeatureScreen({super.key, this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title ?? "")),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Padding(
          padding: EdgeInsets.all(16.00),
        ),
      ),
    );
  }
}
