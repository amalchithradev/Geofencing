import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hub/Themes/gfThemes.dart';

import '../Controller/GeoFencingController.dart';
import '../Widgets/dialogs.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Dialogs dialogs = Dialogs();
  final GeofenceController geofenceController = Get.put(GeofenceController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 1;
    double height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          bool? exit = await dialogs.exitAppDialog(context);
          return exit!;
        },
        child: SafeArea(
          child: SizedBox(
            height: height * 1,
            width: width * 1,
            child: Center(
              child: Obx(() => geofenceController.isLoading.value == false?Container(
                height: height * 0.25, width: width * 0.5,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: geofenceController.buttonColor.value,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: TextButton(
                  onPressed: geofenceController.checkGeofence,
                  child: Text(
                    'START',
                    style: gfTheme(context).primaryTextTheme.headline5
                  ),
                ),
              ):CircularProgressIndicator(color: geofenceController.buttonColor.value,)),
            ),
          ),
        ),
      ),
    );
  }
}
