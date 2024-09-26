import 'package:flutter/material.dart';
import 'package:wild_eye/Objects/flora.dart';
import 'package:wild_eye/Pages/flora_info_screen.dart';


typedef ToDoListChangedCallback = Function(Flora item);
typedef ToDoListRemovedCallback = Function(Flora item);


class FloraListItem extends StatefulWidget {
  FloraListItem(
      {required this.flora,})
      : super(key: ObjectKey(flora));

  final Flora flora;
  

  
  TextStyle? _getTextStyle(BuildContext context) {

    return const TextStyle(
      color: Colors.black54,
      //decoration: TextDecoration.lineThrough,
    );
  }

  @override
  State<FloraListItem> createState() => _FloraListItemState();
}

class _FloraListItemState extends State<FloraListItem> {
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap:
        () async {await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => FloraInfoDisplay(flora: widget.flora),
              ),
            
            );
        //HomeScreen: flora_dialog
      },
      
      onLongPress: 
           () {
            }
          ,
      leading: ElevatedButton(
        onPressed:() {
          setState(() {
           // widget.flora.addNumLocation(); //edit this
          });
        },
        //style: ElevatedButton.styleFrom(backgroundColor: widget.flora.type.rgbColor), //change
        child: Text (widget.flora.getNumLocations()),
         
      ),
      title: Text(
        widget.flora.name,
        style: widget._getTextStyle(context),
      ),
    );
  }
}