import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/GeoFencingController.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GeofenceController geofenceController = Get.put(GeofenceController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 1;
    double height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      body: SafeArea(
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
                    color: Colors.black.withOpacity(0.2), // Shadow color
                    spreadRadius: 5, // Spread radius
                    blurRadius: 10, // Blur radius
                    offset: Offset(0, 3), // Offset in the positive Y direction
                  ),
                ],
              ),
              child: TextButton(
                onPressed: geofenceController.checkGeofence,
                child: Text(
                  'START',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: width * 0.1,
                  ),
                ),
              ),
            ):CircularProgressIndicator(color: geofenceController.buttonColor.value,)),
          ),
        ),
      ),
    );
  }
}
