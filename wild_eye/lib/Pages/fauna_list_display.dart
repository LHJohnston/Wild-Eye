import 'package:flutter/material.dart';
import 'package:wild_eye/Objects/fauna.dart';
import 'package:wild_eye/Objects/location.dart';
import 'package:wild_eye/Widgets/fauna_list.dart';
import 'package:wild_eye/Widgets/flora_dialog.dart';

class FaunaList extends StatefulWidget {
  const FaunaList({super.key, /*required this.camera*/});
  //final CameraDescription camera;
  @override
  State createState() => _FaunaListState();
}

class _FaunaListState extends State<FaunaList> {
  final List<Fauna> items = [Fauna(name: "add more fauna", location: Location(locationName:"here", numItems: 5) )];
  final _itemSet = <Fauna>{};

  void _handleListChanged(Fauna item) {
    setState(() {
      // When a user changes what's in the list, you need
      // to change _itemSet inside a setState call to
      // trigger a rebuild.
      // The framework then calls build, below,
      // which updates the visual appearance of the app.


    });
  }


  void _handleDeleteItem(Fauna item) {
    setState(() {
      print("Deleting item");
      items.remove(item);
    });
  }
   void _handleNewItem(TextEditingController textController, TextEditingController txtcontroller, TextEditingController txtcontrol, TextEditingController comments, TextEditingController locnumber) {
    setState(() {
      print("Adding new item");
      Fauna fauna = Fauna(name: textController.text, location: Location(locationName:txtcontroller.text, numItems: int.parse(locnumber.text)));
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
              
            );
          }).toList(),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {showDialog(
                  context: context,
                  builder: (_) {
                    return FloraDialog(onListAdded: _handleNewItem);
                  });}, 
                child: const Icon(Icons.add),),
        );
  }
}

