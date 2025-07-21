import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:krungthai_next/views/auth/models/signupmodel.dart';
import 'package:krungthai_next/views/auth/views/signupscreen.dart';
import 'package:krungthai_next/views/controllers/trans_controller.dart';
import 'package:krungthai_next/views/home/views/homescreen.dart';
import 'package:krungthai_next/widgets/barcode.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final trans = Get.find<TransController>();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  List<SignupModel> users = [];

  late SharedPreferences prefs;

  @override
  void initState() {
    getSharedPrefrences();

    super.initState();
  }

  getSharedPrefrences() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Obx(
                    () => ToggleButtons(
                      direction:
                          trans.vertical ? Axis.vertical : Axis.horizontal,
                      onPressed: (int index) {
                        for (int i = 0; i < trans.selected.length; i++) {
                          trans.selected[i] = i == index;
                        }
                        var langIndex =
                            trans.selected.indexWhere((v) => v == true);
                        trans.changeLanguages(langIndex);
                      },
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      selectedBorderColor:
                          Theme.of(context).colorScheme.primary,
                      selectedColor: Colors.white,
                      fillColor: Theme.of(context).colorScheme.primary,
                      color: Colors.white,
                      constraints: const BoxConstraints(
                        minHeight: 30.0,
                        minWidth: 40.0,
                      ),
                      isSelected: trans.selected,
                      children: [
                        Text(
                          'TH',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'EN',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.05,
                  )
                ],
              ),
              Text(
                'login'.tr,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  color: Color(0xFF1C1C1C),
                ),
              ),
              SizedBox(height: 26),
              SizedBox(height: 16),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'username'.tr,
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'password'.tr,
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              SizedBox(height: 26),
              SizedBox(
                width: double.infinity,
                height: 49,
                child: ElevatedButton(
                  onPressed: () {
                    login();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF3B62FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'ok_btn'.tr,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 26),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text("forget_password".tr,
                          style: TextStyle(fontSize: 12, color: Colors.blue))),
                  Row(
                    children: [
                      Text("dont_have_account".tr,
                          style: TextStyle(fontSize: 12, color: Colors.grey)),
                      TextButton(
                          onPressed: () {
                            Get.to(() => SignupScreen());
                          },
                          child: Text("signup".tr,
                              style:
                                  TextStyle(fontSize: 12, color: Colors.blue))),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  login() {
    prefs.setString('user', usernameController.text.toString());
    prefs.setString('password', passwordController.text.toString());
    List<String>? userJsonList = prefs.getStringList('user_list');
    if (userJsonList != null) {
      users = userJsonList
          .map((contact) => SignupModel.fromJson(json.decode(contact)))
          .toList();
    }
    bool checkuser = users!.any(
      (u) => (u.username == usernameController.text &&
          u.password == passwordController.text),
    );
    if (checkuser == true) {
      Get.to(() => HomeScreen());
    }
  }
}
