import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hub/Screens/LockScreen.dart';
import 'package:hub/Screens/SplashScreen.dart';
import 'package:hub/Themes/gfThemes.dart';

import 'Screens/HomeScreen.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Geofencing',
      theme: gfTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(name: '/lock', page: () => LockScreen()),
        GetPage(name: '/home', page: () => HomeScreen()),
      ],
    );
  }
}
