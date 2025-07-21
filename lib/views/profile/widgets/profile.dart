import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  File? selectedImage;

  Future<void> chooseImage(String source) async {
    final picker = ImagePicker();
    XFile? image;

    if (source == "Camera") {
      image = await picker.pickImage(source: ImageSource.camera);
    } else {
      image = await picker.pickImage(source: ImageSource.gallery);
    }

    if (image != null) {
      setState(() {
        selectedImage = File(image!.path);
      });
    }
  }

  void showImageSourceActionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.camera),
            title: const Text('Camera'),
            onTap: () {
              Navigator.pop(context);
              chooseImage("Camera");
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: const Text('Gallery'),
            onTap: () {
              Navigator.pop(context);
              chooseImage("Gallery");
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pick Image')),
      body: Center(
        child: GestureDetector(
          onTap: () => showImageSourceActionSheet(context),
          child: CircleAvatar(
            radius: 60,
            backgroundImage:
                selectedImage != null ? FileImage(selectedImage!) : null,
            child: selectedImage == null
                ? const Icon(Icons.add_a_photo, size: 40)
                : null,
          ),
        ),
      ),
    );
  }
}
