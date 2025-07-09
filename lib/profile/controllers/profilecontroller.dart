import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  var selectedImage = Rxn<File>();
  final picker = ImagePicker();

  Future<void> chooseImage(ImageSource source) async {
    final XFile? image = await picker.pickImage(source: source);
    if (image != null) {
      selectedImage.value = File(image.path);
    }
  }
}
