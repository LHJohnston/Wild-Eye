import 'package:flutter/material.dart';
import 'package:wild_eye/Objects/fauna.dart';
import 'package:wild_eye/Objects/location.dart';
import 'package:wild_eye/Widgets/fauna_dialog.dart';
import 'package:wild_eye/Widgets/fauna_list.dart';
import 'package:wild_eye/Widgets/flora_dialog.dart';
import 'package:camera/camera.dart';

typedef OnListAddedCallback = Function(
    String name, String locationName, int numItems, XFile? xfile);
typedef OnListRemovedCallback = Function(Fauna fauna);

class FaunaList extends StatefulWidget {
  const FaunaList(
      {required this.camera,
      super.key,
      required this.items,
      required this.onListAdded,
      required this.onDeleteItem});

  final camera;
  final List<Fauna> items;
  final OnListAddedCallback onListAdded;
  final OnListRemovedCallback onDeleteItem;

  @override
  State createState() => _FaunaListState();
}

class _FaunaListState extends State<FaunaList> {
  final _itemSet = <Fauna>{};

  void _handleNewFaunaItem(
      String name, String locationName, int numItems, XFile? xfile) {
    setState(() {
      // Fauna fauna = Fauna(
      //     name: name,
      //     location: Location(locationName: locationName, numItems: numItems));
      // widget.items.add(fauna);
    });
  }

  void _handleDeleteFaunaItem(Fauna fauna) {
    setState(() {
      // widget.items.remove(fauna);
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
        children: widget.items.map((item) {
          return FaunaListItem(
              fauna: item,
              onDelete: widget.onDeleteItem,
              onDeletes: _handleDeleteFaunaItem);
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            showDialog(
                context: context,
                builder: (_) {
                  return FaunaDialog(
                    dialogCamera: widget.camera,
                    onListAdded: widget.onListAdded,
                    onListAddeds: _handleNewFaunaItem,
                  );
                });
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
