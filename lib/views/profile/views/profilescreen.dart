import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:krungthai_next/views/home/controllers/homecontroller.dart';
import 'package:krungthai_next/views/profile/controllers/profilecontroller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final controller = Get.put(HomeController());

  late SharedPreferences prefs;
  String username = '';

  @override
  void initState() {
    getSharedPrefrences();
    super.initState();
  }

  getSharedPrefrences() async {
    prefs = await SharedPreferences.getInstance();
    getusername();
  }

  getusername() {
    String? usernameprefs = prefs.getString('user');
    if (usernameprefs != null) {
      setState(() {
        username = usernameprefs;
      });
    }
    print({"username: $username"});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("profile".tr),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const ProfilePic(),
            const SizedBox(height: 20),
            Obx(() => Text("${controller.username.value}")),
            Text(
              '$username',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ProfileMenu(
              text: "my_account".tr,
              press: () => {},
            ),
            ProfileMenu(
              text: "notifications".tr,
              press: () {},
            ),
            ProfileMenu(
              text: "settings".tr,
              press: () {},
            ),
            ProfileMenu(
              text: "help_center".tr,
              press: () {},
            ),
            ProfileMenu(
              text: "logout".tr,
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePic extends StatelessWidget {
  const ProfilePic({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());

    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          Obx(() {
            return CircleAvatar(
              backgroundImage: controller.base64Image.value.isNotEmpty
                  ? MemoryImage(base64Decode(controller.base64Image.value))
                  : null,
            );
          }),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: const BorderSide(color: Colors.white),
                  ),
                  backgroundColor: const Color(0xFFF5F6F9),
                ),
                onPressed: () =>
                    _showImageSourceActionSheet(context, controller),
                child:
                    const Icon(Icons.camera_alt_outlined, color: Colors.grey),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _showImageSourceActionSheet(
      BuildContext context, ProfileController controller) {
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
              controller.chooseImage(ImageSource.camera);
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: const Text('Gallery'),
            onTap: () {
              Navigator.pop(context);
              controller.chooseImage(ImageSource.gallery);
            },
          ),
        ],
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    this.press,
  }) : super(key: key);

  final String text;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: const Color(0xFFFF7643),
          padding: const EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: const Color(0xFFF5F6F9),
        ),
        onPressed: press,
        child: Row(
          children: [
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  color: Color(0xFF757575),
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Color(0xFF757575),
            ),
          ],
        ),
      ),
    );
  }
}
