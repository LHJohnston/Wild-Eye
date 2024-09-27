import 'package:flutter/material.dart';
import 'package:wild_eye/Objects/fauna.dart';
import 'package:wild_eye/Objects/flora.dart';
import 'package:wild_eye/Objects/location.dart';
import 'package:wild_eye/Pages/flora_list_display.dart';

class FloraInfoDisplay extends StatefulWidget {
  const FloraInfoDisplay( 
{required this.flora,})
      : super(key: const ObjectKey(Flora));
  final Flora flora;
  @override
  State createState() => _FloraInfoDisplayState();

 
}


class _FloraInfoDisplayState extends State<FloraInfoDisplay> {
  //final Flora flora = widget.flora;
  //final List<Flora> items = [Flora(name: "idk", locations: [Location(locationName:"here", numItems: 5)] )];

 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.flora.getName())
      ),
      body: Center(
        child: Column(
          children: [
            /*ListView.builder(itemCount: widget.flora.getLocations().length, itemBuilder: (BuildContext context, int index){
              return Container(height: 50, child: Center(child: Text('${widget.flora.getLocations()[index]}'),),);
            },),*/
            Text(widget.flora.getinfo())
      
          ]
        ),
       
      ),
      
    );
  }
}