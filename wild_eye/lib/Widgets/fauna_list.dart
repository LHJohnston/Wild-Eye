import 'package:flutter/material.dart';
import 'package:wild_eye/Objects/fauna.dart';
import 'package:wild_eye/Pages/fauna_info_screen.dart';

typedef ToDoListChangedCallback = Function(Fauna item);
typedef ToDoListRemovedCallback = Function(Fauna item);

class FaunaListItem extends StatefulWidget {
  FaunaListItem(
      {required this.fauna, required this.onDelete, required this.onDeletes})
      : super(key: ObjectKey(fauna));

  final Fauna fauna;
  final ToDoListRemovedCallback onDelete;
  final ToDoListRemovedCallback onDeletes;

  TextStyle? _getTextStyle(BuildContext context) {
    return const TextStyle(
      color: Colors.black54,
      //decoration: TextDecoration.lineThrough,
    );
  }

  @override
  State<FaunaListItem> createState() => _FaunaListItemState();
}

class _FaunaListItemState extends State<FaunaListItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => FaunaInfoDisplay(fauna: widget.fauna),
          ),
        );
        //HomeScreen: flora_dialog
      },
      onLongPress: () {
        widget.onDelete(widget.fauna);
        widget.onDeletes(widget.fauna);
      },
      leading: ElevatedButton(
        onPressed: () {
          setState(() {
            // widget.flora.addNumLocation(); //edit this
          });
        },
        //style: ElevatedButton.styleFrom(backgroundColor: widget.flora.type.rgbColor), //change
        child: Text(widget.fauna.getNumLocations()),
      ),
      title: Text(
        widget.fauna.name,
        style: widget._getTextStyle(context),
      ),
    );
  }
}
