import 'package:flutter/material.dart';
import 'package:wild_eye/Objects/flora.dart';

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
            
            const SizedBox(height: 20),
              Container(
                width: 300,
                height: 150,
                color: Colors.grey.shade300,
                child:  Center(child: Text("picture", 
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                )
                )
              ), 
            const SizedBox(height: 10),
            Text("Location:", style: TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
              Container(
                width: 200,
                height: 50,
                color: Colors.grey.shade300,
                child:  Center(child: Text(widget.flora.getLocationName(), 
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                )
                )
              ),
              const SizedBox(height: 10),
              const Text(
              'Number sighted:', style: TextStyle(fontSize: 20)
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center,children: [
              Text(
              widget.flora.numsightings.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(width: 20),
            FloatingActionButton(onPressed: () {setState(() {widget.flora.addSighting();
            });}, child: Icon(Icons.add)),
            ],
            ),
            

            Text(
              "Additional Info", style: TextStyle(fontSize: 20),
              ),
            const SizedBox(height: 10),
              Container(
                width: 300,
                height: 100,
                color: Colors.grey.shade300,
                child:  Center(child: Text(widget.flora.getinfo(), 
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                )
                )
              ), 
      
          ]
        ),
       
      ),
      
    );
  }
}