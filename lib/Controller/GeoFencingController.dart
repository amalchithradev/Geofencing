import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class GeofenceController extends GetxController {
  Rx<Color> buttonColor = Colors.red.obs;
  RxBool isLoading = false.obs;

  final double geofenceLatitude = 10.010092;
  final double geofenceLongitude = 76.336313;
  final double geofenceRadius = 200.0;

  Future<void> checkGeofence() async {
    isLoading.value = true; /// Show loader

    final status = await Permission.location.status;

    if (status.isGranted) {
      await _checkUserLocation();
    } else if (status.isDenied) {
      await Permission.location.request();
      await _checkUserLocation();
    }

    isLoading.value = false;
  }

  Future<void> _checkUserLocation() async {
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,

    );

    final distance = Geolocator.distanceBetween(
      geofenceLatitude,
      geofenceLongitude,
      position.latitude,
      position.longitude,
    );

    if (distance <= geofenceRadius) {
      buttonColor.value = Colors.green;
    } else {
      buttonColor.value = Colors.red;
    }
  }
}
