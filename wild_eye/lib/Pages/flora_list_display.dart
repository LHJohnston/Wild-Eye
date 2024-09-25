import 'package:flutter/material.dart';
import 'package:wild_eye/Objects/flora.dart';
import 'package:wild_eye/Objects/location.dart';
import 'package:wild_eye/Widgets/flora_list.dart';

class FloraList extends StatefulWidget {
  const FloraList({super.key});

  @override
  State createState() => _FloraListState();
}

class _FloraListState extends State<FloraList> {
  final List<Flora> items = [Flora(name: "add more flora", locations: [Location(locationName:"here", numItems: 5)] )];
  final _itemSet = <Flora>{};

  void _handleListChanged(Flora item) {
    setState(() {
      // When a user changes what's in the list, you need
      // to change _itemSet inside a setState call to
      // trigger a rebuild.
      // The framework then calls build, below,
      // which updates the visual appearance of the app.


    });
  }

  void _handleDeleteItem(Flora item) {
    setState(() {
      print("Deleting item");
      items.remove(item);
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
        );
  }
}

