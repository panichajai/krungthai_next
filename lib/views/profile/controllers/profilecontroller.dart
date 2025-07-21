import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  final picker = ImagePicker();
  var base64Image = ''.obs;

  Future<void> chooseImage(ImageSource source) async {
    final XFile? image = await picker.pickImage(source: source);
    if (image != null) {
      final bytes = await File(image.path).readAsBytes();
      final base64Str = base64Encode(bytes);
      base64Image.value = base64Str;
      await saveImage(base64Str);
    }
  }

  Future<void> saveImage(String base64Image) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('profile_image', base64Image);
  }
}
