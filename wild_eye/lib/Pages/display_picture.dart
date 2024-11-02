import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:wild_eye/Pages/home_screen.dart';
import 'package:wild_eye/Pages/take_picture.dart';

class DisplayPictureScreen extends StatelessWidget {
  const DisplayPictureScreen({super.key, required this.img, required this.theCamera});

  final CameraDescription theCamera;
  final XFile img;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Image.file(File(img.path)),
      persistentFooterButtons: [ElevatedButton(onPressed: () async {
        
        Navigator.pop(context);
        Navigator.pop(context, img);
       
       }, 
       child: const Text ('Save'))]);
    
    
  
  }
}