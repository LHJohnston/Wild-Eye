import 'package:flutter/material.dart';
import 'package:wild_eye/Objects/flora.dart';
import 'package:wild_eye/Objects/location.dart';
import 'package:wild_eye/Widgets/flora_list.dart';
import 'package:wild_eye/Widgets/flora_dialog.dart';

class FloraList extends StatefulWidget {
  const FloraList({super.key});

  @override
  State createState() => _FloraListState();
}

class _FloraListState extends State<FloraList> {
  final List<Flora> items = [Flora(name: "add more flora", location: Location(locationName:"here", numItems: 5) )];
  final _itemSet = <Flora>{};

  /*void _handleListChanged(Flora item) {
    setState(() {
      // When a user changes what's in the list, you need
      // to change _itemSet inside a setState call to
      // trigger a rebuild.
      // The framework then calls build, below,
      // which updates the visual appearance of the app.


    });
  }*/

  void _handleDeleteItem(Flora flora) {
    setState(() {
      print("Deleting item");
      //_itemSet.remove(item);
      items.remove(flora);
    });
  }

  void _handleNewItem(TextEditingController textController, TextEditingController txtcontroller, TextEditingController txtcontrol, TextEditingController comments, TextEditingController locnumber) {
    setState(() {
      print("Adding new item");
      Flora flora = Flora(name: textController.text, location: Location(locationName:txtcontroller.text, numItems: int.parse(locnumber.text)));
      //_itemSet.add(item);
      items.insert(0, flora);
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
          title: const Text('Flora'),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          children: items.map((item) {
            return FloraListItem(
              flora: item,
              
            );
          }).toList(),
        ),
        floatingActionButton: ElevatedButton(onPressed: () {showDialog(
                  context: context,
                  builder: (_) {
                    return FloraDialog(onListAdded: _handleNewItem);
                  });}, 
                child: const Icon(Icons.add),),
        );
  }
}

