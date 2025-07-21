import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TransController extends GetxController {
  var locale = const Locale('th').obs;
  // final _vertical = false.obs;

  final selected = <bool>[true, false].obs;

  // bool get vertical => _vertical.value;
  // set vertical(bool value) => _vertical(value);

  GetStorage box = GetStorage();

  checkLanguages() async {
    final lang = await box.read('lang') ?? 'th';
    locale.value = Locale(lang);
    selected.assignAll([lang == 'th', lang == 'en']);
    Get.updateLocale(locale.value);
  }

  changeLanguages(int index) async {
    locale.value = index == 0 ? const Locale('th') : const Locale('en');
    await box.write('lang', locale.value.languageCode);
    Get.updateLocale(locale.value);
  }
}
