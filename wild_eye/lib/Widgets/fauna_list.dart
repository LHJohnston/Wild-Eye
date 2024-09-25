import 'package:flutter/material.dart';
import 'package:wild_eye/Objects/fauna.dart';


typedef ToDoListChangedCallback = Function(Fauna item, bool completed);
typedef ToDoListRemovedCallback = Function(Fauna item);


class FloraListItem extends StatefulWidget {
  FloraListItem(
      {required this.fauna,
      required this.completed,
      required this.onListChanged,
      required this.onDeleteItem})
      : super(key: ObjectKey(fauna));

  final Fauna fauna;
  final bool completed;

  final ToDoListChangedCallback onListChanged;
  final ToDoListRemovedCallback onDeleteItem;

  Color _getColor(BuildContext context) {
    // The theme depends on the BuildContext because different
    // parts of the tree can have different themes.
    // The BuildContext indicates where the build is
    // taking place and therefore which theme to use.

    return completed // returned Colors.black instead of Colors.black54
        ? Colors.black54
        : Theme.of(context).primaryColor;
  }

  TextStyle? _getTextStyle(BuildContext context) {
    if (!completed) return null;

    return const TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  State<FloraListItem> createState() => _FloraListItemState();
}

class _FloraListItemState extends State<FloraListItem> {
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
      },
      onLongPress: widget.completed
          ? () {
            }
          : null,
      leading: ElevatedButton(
        onPressed:() {
          setState(() {
           // widget.fauna.addNumLocation(); //edit this
          });
        },
        //style: ElevatedButton.styleFrom(backgroundColor: widget.fauna.type.rgbColor), //change
        child: Text (widget.fauna.getNumLocations()),
         
      ),
      title: Text(
        widget.fauna.name,
        style: widget._getTextStyle(context),
      ),
    );
  }
}