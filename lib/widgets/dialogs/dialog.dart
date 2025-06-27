import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DialogApp extends StatefulWidget {
  const DialogApp({super.key, required this.content, this.submit});

  final String content;
  final void Function()? submit;
  @override
  State<DialogApp> createState() => _DialogAppState();
}

class _DialogAppState extends State<DialogApp> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('AlertDialog Title'),
      content: Text(widget.content),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ],
    );
  }
}
