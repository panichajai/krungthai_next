import 'package:get/get.dart';
import 'package:krungthai_next/views/auth/models/signupmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  late SharedPreferences prefs;

  RxString username = ''.obs;
  RxString password = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getSharedPrefrences();
  }

  getSharedPrefrences() async {
    prefs = await SharedPreferences.getInstance();
    username.value = prefs.getString('user') ?? '';
    password.value = prefs.getString('password') ?? '';
  }

  removeuser() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove('user');
    await prefs.remove('password');

    username.value = '';
    password.value = '';
    readUsers();
  }

  readUsers() async {
    final prefs = await SharedPreferences.getInstance();

    final String? user = prefs.getString('user');
    final String? password = prefs.getString('password');

    print({"user: $user"});
    print({"password: $password"});
  }
}
