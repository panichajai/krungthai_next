import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krungthai_next/views/auth/models/signupmodel.dart';
import 'package:krungthai_next/views/auth/views/loginscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final emailController = TextEditingController();
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
              const Text(
                "Signup",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  color: Color(0xFF1C1C1C),
                ),
              ),
              const SizedBox(height: 26),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 26),
              SizedBox(
                width: double.infinity,
                height: 49,
                child: ElevatedButton(
                  onPressed: saveUser,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF3B62FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("You have account?",
                      style: TextStyle(fontSize: 12, color: Colors.grey)),
                  TextButton(
                      onPressed: () {
                        Get.to(() => LoginScreen());
                      },
                      child: Text("Login",
                          style: TextStyle(fontSize: 12, color: Colors.blue))),
                ],
              ),
              // const SizedBox(height: 16),
              // SizedBox(
              //   width: double.infinity,
              //   height: 49,
              //   child: ElevatedButton(
              //     onPressed: readUsers,
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: Color(0xFF3B62FF),
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(10),
              //       ),
              //     ),
              //     child: const Text(
              //       'Read',
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontSize: 16,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  void saveUser() {
    String email = emailController.text.trim();
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();
    if (email.isNotEmpty && username.isNotEmpty && password.isNotEmpty) {
      final newUser = SignupModel(
        email: email,
        username: username,
        password: password,
      );
      users.add(newUser);
      List<String> userJsonList =
          users.map((e) => jsonEncode(e.toJson())).toList();
      prefs.setStringList('user_list', userJsonList);
      print({"$userJsonList userJsonList"});

      emailController.clear();
      usernameController.clear();
      passwordController.clear();
    }
  }

  readUsers() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? userJsonList = prefs.getStringList('user_list');
    if (userJsonList != null) {
      users = userJsonList
          .map((e) => SignupModel.fromJson(json.decode(e)))
          .toList();
    }
    final String? user = prefs.getString('user');
    final String? password = prefs.getString('password');

    print({"users: $userJsonList"});
    print({"user: $user"});
    print({"password: $password"});

    setState(() {});
  }

  // removeuser() {
  //   prefs.remove('user_list');
  //   // prefs.remove('user');
  //   // prefs.remove('password');
  //   users.clear();
  //   setState(() {});
  // }
}
