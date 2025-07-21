// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:krungthai_next/auth/models/signupmodel.dart';
// import 'package:krungthai_next/widgets/barcode.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final usernameController = TextEditingController();
//   final passwordController = TextEditingController();
//   List<SignupModel> users = [];

//   late SharedPreferences prefs;

//   @override
//   void initState() {
//     getSharedPrefrences();

//     super.initState();
//   }

//   getSharedPrefrences() async {
//     prefs = await SharedPreferences.getInstance();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(30.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(
//                 'LogIn',
//                 style: TextStyle(
//                   fontFamily: 'Poppins',
//                   fontWeight: FontWeight.bold,
//                   fontSize: 26,
//                   color: Color(0xFF1C1C1C),
//                 ),
//               ),
//               SizedBox(height: 26),
//               SizedBox(height: 16),
//               TextField(
//                 controller: usernameController,
//                 decoration: InputDecoration(
//                   labelText: 'Username',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 16),
//               TextField(
//                 controller: passwordController,
//                 decoration: InputDecoration(
//                   labelText: 'Password',
//                   border: OutlineInputBorder(),
//                 ),
//                 obscureText: true,
//               ),
//               SizedBox(height: 26),
//               SizedBox(
//                 width: double.infinity,
//                 height: 49,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     login();
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Color(0xFF3B62FF),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   child: Text(
//                     'LogIn',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 26),
//               Center(
//                 child: Text(
//                   'Forgot Password?',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Color(0xFF87879D),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10),
//               Center(
//                 child: Text(
//                   "Don't have an account? Sign Up",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontFamily: 'Poppins',
//                     fontSize: 14,
//                     color: Color(0xFF87879D),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   login() {
//     prefs.setString('user', usernameController.text.toString());
//     prefs.setString('password', passwordController.text.toString());
//     List<String>? userJsonList = prefs.getStringList('user_list');
//     if (userJsonList != null) {
//       users = userJsonList
//           .map((contact) => SignupModel.fromJson(json.decode(contact)))
//           .toList();
//     }
//     bool user = users!.any(
//       (u) => (u.username == usernameController.text &&
//           u.password == passwordController.text),
//     );
//     if (user == true) {
//       Get.to(() => BarcodeScannerScreen());
//     }
//   }
// }
