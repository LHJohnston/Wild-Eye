import 'package:flutter/material.dart';
import 'package:wild_eye/Objects/fauna.dart';
import 'package:wild_eye/Objects/location.dart';
import 'package:wild_eye/Widgets/fauna_list.dart';
import 'package:wild_eye/Widgets/flora_dialog.dart';
import 'package:camera/camera.dart';

class FaunaList extends StatefulWidget {
  const FaunaList({required this.camera, super.key});
  
  final CameraDescription camera;
  
  @override
  State createState() => _FaunaListState();
}

class _FaunaListState extends State<FaunaList> {
  final List<Fauna> items = [Fauna(name: "add more fauna", location: Location(locationName:"here", numItems: 5) )];
  final _itemSet = <Fauna>{};


  void _handleDeleteItem(Fauna item) {
    setState(() {
      print("Deleting item");
      items.remove(item);
    });
  }
    void _handleNewItem(TextEditingController textController, TextEditingController txtcontroller, TextEditingController txtcontrol, TextEditingController comments, TextEditingController locnumber, XFile? img) {
    setState(() {
      print("Adding new item");
      Fauna fauna = Fauna(info: comments.text, numsightings: int.parse(locnumber.text), name: textController.text, location: Location(locationName:txtcontroller.text, numItems: int.parse(locnumber.text)), image: img);
      //_itemSet.add(item);
      items.insert(0, fauna);
      textController.clear();
      txtcontroller.clear();
      txtcontrol.clear();
      comments.clear();
      locnumber.clear();
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Fauna'),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          children: items.map((item) {
            return FaunaListItem(
              fauna: item,
              onDelete: _handleDeleteItem,
              
            );
          }).toList(),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {showDialog(
                  context: context,
                  builder: (_) {
                    return FloraDialog(dialogCamera: widget.camera, onListAdded: _handleNewItem);
                  });}, 
                child: const Icon(Icons.add),),
        );
  }

  }


  
  


  

