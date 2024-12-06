import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:wild_eye/Objects/flora.dart';
import 'package:wild_eye/Objects/location.dart';
import 'package:wild_eye/Widgets/flora_dialog.dart';
import 'package:wild_eye/Widgets/flora_list.dart';

typedef OnListAddedCallback = Function(
    String name, String locationName, int numItems, XFile? xfile);
typedef OnListRemovedCallback = Function(Flora flora);

class FloraList extends StatefulWidget {
  const FloraList(
      {required this.camera,
      super.key,
      required this.items,
      required this.onListAdded,
      required this.onDeleteItem});
  final camera;
  final List<Flora> items;
  final OnListAddedCallback onListAdded;
  final OnListRemovedCallback onDeleteItem;
  @override
  State createState() => _FloraListState();
}

class _FloraListState extends State<FloraList> {
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
      // print("Deleting item");
      // //_itemSet.remove(item);
      // widget.items.remove(flora);
    });
  }

  void _handleNewItem(
      String name, String locationName, int numItems, XFile? xfile) {
    setState(() {
      //   Flora flora = Flora(
      //       name: name,
      //       location: Location(locationName: locationName, numItems: numItems));
      //   print("Adding new item");
      //   //_itemSet.add(item);
      //   widget.items.add(flora);
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
        children: widget.items.map((item) {
          return FloraListItem(
            flora: item,
            onDelete: widget.onDeleteItem,
            onDeletes: _handleDeleteItem,
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) {
                return FloraDialog(
                  dialogCamera: widget.camera,
                  onListAdded: widget.onListAdded,
                  onListAddeds: _handleNewItem,
                );
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
