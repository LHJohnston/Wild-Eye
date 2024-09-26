import 'dart:async';
import 'package:flutter/material.dart';
import 'package:wild_eye/pages/flora_list_display.dart';
import 'package:wild_eye/pages/fauna_list_display.dart';
import 'package:wild_eye/pages/map_display.dart';



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
      //mainAxisSize: MainAxisSize.max,
      children: <Widget>[ElevatedButton(onPressed: () async {await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => FloraList(
                ),
              ),
            );},
       child: const Text('Flora')), 
       ElevatedButton(onPressed: () async {await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => FaunaList(
                ),
              ),
            );}, 
       child: const Text('Fauna'))]);
    
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
          children: <Widget>[
            FloraFaunaButtons(),
            ButtonSection(),
            ],
        ),
       
      ),
      
    );
  }

}