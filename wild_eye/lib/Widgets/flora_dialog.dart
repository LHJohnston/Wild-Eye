import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:wild_eye/Objects/flora.dart';
import 'package:wild_eye/Pages/take_picture.dart';

typedef FloraListAddedCallback = Function(
    TextEditingController textConroller, TextEditingController txtcontroller, TextEditingController txtcontrol, TextEditingController locnumber, TextEditingController comments);

class FloraDialog extends StatefulWidget {
  const FloraDialog({
    super.key,
    required this.onListAdded,
  });

  final FloraListAddedCallback onListAdded;

  @override
  State<FloraDialog> createState() => _ToDoDialogState();
}
 enum faunaorFlora{
  fauna,
  flora,
}
const List<(faunaorFlora, String)> lifeOptions = <(faunaorFlora, String)>[
  (faunaorFlora.fauna, "fauna"),
  (faunaorFlora.flora, "flora"),

];

class _ToDoDialogState extends State<FloraDialog> {
  // Dialog with text from https://www.appsdeveloperblog.com/alert-dialog-with-a-text-field-in-flutter/
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _sightingsController = TextEditingController();
  final TextEditingController _commentsController = TextEditingController();
  final TextEditingController _locnumberController = TextEditingController();
  final ButtonStyle yesStyle = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20), backgroundColor: Colors.green);
  final ButtonStyle noStyle = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20), backgroundColor: Colors.red);

  String valueText = "";
  final List<bool> _toggleButtonSelection = faunaorFlora.values.map((faunaorFlora e) => e == faunaorFlora.fauna).toList();
 
 Future<void> cam() async{
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final cameraOne = cameras.first;
 } 


  

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Item'),
      content: Column(children: [
       TextField(
        onChanged: (value) {
          setState(() {
            valueText = value;
          });
        },
        controller: _nameController,
        decoration: const InputDecoration(hintText: "Name"),
      ),
      TextField(
        onChanged: (value) {
          setState(() {
            valueText = value;
          });
        },
        controller: _locationController,
        decoration: const InputDecoration(hintText: "Location Name"),
      ),
      TextField(
        onChanged: (value) {
          setState(() {
            valueText = value;
          });
        },
        controller: _locnumberController,
        decoration: const InputDecoration(hintText: "Location Number"),
        ),
        //Row(children: [
      TextField(
        onChanged: (value) {
          setState(() {
            valueText = value;
          });
        },
        controller: _sightingsController,
        decoration: const InputDecoration(hintText: "Number spotted"),
        ),
        /*FloatingActionButton(
            child: const Icon(Icons.camera),
            key: Key('Add Picture'), 
            onPressed: () async{await Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => TakePictureScreen(camera: cameraOne
                  ),
                ),
        );},
            )*/
      //]),
        TextField(
        onChanged: (value) {
          setState(() {
            valueText = value;
          });
        },
        controller: _commentsController,
        decoration: const InputDecoration(hintText: "Additional Info"),
        ),
      ],
      ),
      actions: <Widget>[
        ElevatedButton(
          key: const Key("CancelButton"),
          style: noStyle,
          child: const Text('Cancel'),
          onPressed: () {
            setState(() {
              
              Navigator.pop(context);
            });
          },
        ),

        // https://stackoverflow.com/questions/52468987/how-to-turn-disabled-button-into-enabled-button-depending-on-conditions
        ValueListenableBuilder<TextEditingValue>(
          valueListenable: _nameController,
          builder: (context, value, child) {
            return ElevatedButton(
              key: const Key("OKButton"),
              style: yesStyle,
              onPressed: value.text.isNotEmpty
                  ? () {
                    
                      setState(() {
                        widget.onListAdded(_nameController, _locationController, _sightingsController, _commentsController, _locnumberController);
                        Navigator.pop(context);
                      });
                    }
                  : null,
              child: const Text('Done'),
            );
          },
        ),
      ],
    );
  }
}
