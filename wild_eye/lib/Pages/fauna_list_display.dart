import 'package:flutter/material.dart';
import 'package:wild_eye/Objects/fauna.dart';
import 'package:wild_eye/Objects/location.dart';
import 'package:wild_eye/Widgets/fauna_list.dart';

class FaunaList extends StatefulWidget {
  const FaunaList({super.key});

  @override
  State createState() => _FaunaListState();
}

class _FaunaListState extends State<FaunaList> {
  final List<Fauna> items = [Fauna(name: "add more fauna", locations: [Location(locationName:"here", numItems: 5)] )];
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
        );
  }
}

