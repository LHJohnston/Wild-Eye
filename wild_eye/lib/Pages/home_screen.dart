import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:wild_eye/Widgets/flora_dialog.dart';
import 'package:wild_eye/pages/flora_list_display.dart';
import 'package:wild_eye/Pages/take_picture.dart';
import 'package:wild_eye/pages/fauna_list_display.dart';
import 'package:wild_eye/pages/map_display.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.thecamera});
  // This widget is the home page of your application
 final CameraDescription thecamera;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}



class FloraFaunaButtons extends StatelessWidget {
  const FloraFaunaButtons({super.key});
  
  get thecamera => null;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Column(children: [Expanded(
            child: ElevatedButton(onPressed: () async {await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => FloraList(
                ),
              ),
            );
            },
       child: const Text('Flora')
          ), 
       ),]),
           
       
       ElevatedButton(onPressed: () async {await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => FaunaList(
                ),
              ),
            );
            }, 
       child: const Text('Fauna')),
       ElevatedButton(onPressed: () async {await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MapDisplay(
                ),
              ),
            );},
                child: const Icon(Icons.location_on)),
       ]
       );
    
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                ElevatedButton(onPressed: () async {await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MapDisplay(
                ),
              ),
            );},
                child: const Icon(Icons.location_on)),
              ]
            );
  
    
  }
}

class _HomeScreenState extends State<HomeScreen> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(Colors.green.value),
        title: const Text('Wild-Eye')
      ),
      body: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
            Expanded(child: ElevatedButton(onPressed: () async {await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => FloraList(camera: camera
                ),
              ),
            );
            }, style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0),)),
             child: Text('Flora', style: new TextStyle(fontSize: 35.0,)),)),
            SizedBox(height: 10),
            Expanded(child: ElevatedButton(onPressed: () async {await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => FaunaList(
                ),
              ),
            );
            },  style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))),
            child: Text('Fauna', style: new TextStyle(fontSize: 35.0,)),)),
            
            //FloraFaunaButtons(),
            //ButtonSection(),
            Row( children: [ElevatedButton(onPressed: () async {await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MapDisplay(
                ),
              ),
            );},
                child: const Icon(Icons.location_on)), ElevatedButton(onPressed: () async {await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => TakePictureScreen(camera: camera)(
                ),
              ),
            );},
                child: const Icon(Icons.camera))],
              
            )],
            ),

          
        
       
      ),
      
    );
  }

}