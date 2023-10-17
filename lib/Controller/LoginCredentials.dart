import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController{

  bool isFirstLaunch = false;
  Future<void> checkCredentialsAndNavigate() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? storedUsername = prefs.getString('username');
    final String? storedPassword = prefs.getString('password');

    if (storedUsername == 'Admin' && storedPassword == '1234') {
      isFirstLaunch = true;
      prefs.setBool('isFirstLaunch', isFirstLaunch);
      Get.toNamed('/home');
    }
  }

  Future<void> setInitialCredentials() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', 'admin');
    await prefs.setString('password', '1234');
  }
}
