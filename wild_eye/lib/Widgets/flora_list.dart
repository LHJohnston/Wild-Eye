import 'package:flutter/material.dart';
import 'package:wild_eye/Objects/flora.dart';


typedef ToDoListChangedCallback = Function(Flora item, bool completed);
typedef ToDoListRemovedCallback = Function(Flora item);


class FloraListItem extends StatefulWidget {
  FloraListItem(
      {required this.flora,
      required this.completed,
      required this.onListChanged,
      required this.onDeleteItem})
      : super(key: ObjectKey(flora));

  final Flora flora;
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
            widget.flora.addNumLocation(); //edit this
          });
        },
        style: ElevatedButton.styleFrom(backgroundColor: widget.flora.type.rgbColor), //change
        child: Text (widget.flora.getNumLocations()),
         
      ),
      title: Text(
        widget.flora.name,
        style: widget._getTextStyle(context),
      ),
    );
  }
}