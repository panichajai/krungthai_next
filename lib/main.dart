import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:krungthai_next/views/controllers/trans_controller.dart';
import 'package:krungthai_next/views/home/views/homescreen.dart';
import 'package:krungthai_next/views/profile/views/profilescreen.dart';
import 'package:krungthai_next/utils/l10n.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final translationController = Get.put(TransController());

  @override
  void initState() {
    super.initState();
    translationController.checkLanguages();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return Obx(
          () => GetMaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
              useMaterial3: true,
            ),
            translations: Messages(),
            locale: translationController.locale.value,
            fallbackLocale: const LanguageTH().locale,
            home:
                // ProfileScreen(),
                HomeScreen(),
          ),
        );
      },
    );
  }
}
