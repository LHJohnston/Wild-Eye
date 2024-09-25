import 'dart:async';
import 'package:flutter/material.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key,});
  // This widget is the home page of your application

  @override
  State<HomeScreen> createState() => _HomeScreenState();
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
            
            ButtonSection(),
            ],
        ),
       
      ),
      
    );
  }

}