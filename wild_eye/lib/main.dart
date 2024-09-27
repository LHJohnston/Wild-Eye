
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:wild_eye/Pages/home_screen.dart';


Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final cameras = await availableCameras();
  final cameraOne = cameras.first;

  CameraDescription getCamera(){
    return cameraOne;
  }
  runApp(
    MaterialApp(
      home: HomeScreen(theCamera: cameraOne),
    )
  );
}
