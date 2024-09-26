import 'package:flutter/material.dart';
import 'package:wild_eye/Objects/fauna.dart';
import 'package:wild_eye/Objects/flora.dart';
import 'package:wild_eye/Objects/location.dart';
import 'package:wild_eye/Pages/fauna_list_display.dart';

class FaunaInfoDisplay extends StatefulWidget {
  const FaunaInfoDisplay( 
{required this.fauna,})
      : super(key: const ObjectKey(Fauna));
  final Fauna fauna;
  @override
  State createState() => _FaunaInfoDisplayState();

 
}


class _FaunaInfoDisplayState extends State<FaunaInfoDisplay> {
  //final Flora flora = widget.flora;
  //final List<Flora> items = [Flora(name: "idk", locations: [Location(locationName:"here", numItems: 5)] )];

 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.fauna.getName())
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
            ],
        ),
       
      ),
      
    );
  }
}