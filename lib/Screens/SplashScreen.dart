import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hub/Themes/gfThemes.dart';
import 'package:shared_preferences/shared_preferences.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _initData();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 1;
    double height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      body: Container(
          width: width * 1,
          height: height * 1,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.red, Colors.deepOrangeAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
       ),
        child: Center(
          child: Text('Geofencing',
            style: gfTheme(context).primaryTextTheme.headline1),
        ),
      ),
    );
  }
  Future _initData() async {
    try {
      Timer(const Duration(seconds: 2), () async {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        switch (prefs.getBool('isFirstLaunch')) {
          case true:
            Get.toNamed('/home');
            break;
          default:
            Get.toNamed('/lock');
            break;
        }

      });
    } catch (e) {
      if (kDebugMode) {
        print('Exception - splashScreen.dart - _initData(): $e');
      }
    }
  }
}
