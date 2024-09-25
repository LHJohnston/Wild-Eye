import 'dart:async';
import 'package:flutter/material.dart';
import 'package:wild_eye/pages/flora_list_display.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key,});
  // This widget is the home page of your application

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}



class FloraFaunaButtons extends StatelessWidget {
  const FloraFaunaButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[Expanded( child: ElevatedButton(onPressed: () {},
       child: const Text('Flora'))), 
       ElevatedButton(onPressed: () async {await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => FloraList(
                  // Pass the automatically generated path to
                  // the DisplayPictureScreen widget.
                ),
              ),
            );},
       child: const Text('Fauna')) ],
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(onPressed: () {},
                child: const Icon(Icons.location_on)),
                ElevatedButton(onPressed: (){},
                child: const Icon(Icons.add),),
              ]
            );
  
    
  }
}

class _HomeScreenState extends State<HomeScreen> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Wild-Eye')
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FloraFaunaButtons(),
            ButtonSection(),
            ],
        ),
       
      ),
      
    );
  }

}