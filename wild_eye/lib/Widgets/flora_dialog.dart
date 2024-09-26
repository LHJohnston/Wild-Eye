import 'package:flutter/material.dart';

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
 //String dropdownvalue = 
  
 
  
  

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Item'),
      content: Column(children: [
        //DropdownButton<faunaorFlora>(
          //value: dropdownvalue,
          //onChanged: (faunaorFlora? newValue){
            //setState(() {
            //  choice = newValue!;
           // });
          //},
          //icon: const Icon(Icons.arrow_downward), 
          //items: faunaorFlora.values.map((faunaorFlora classType){
           // return DropdownMenuItem<faunaorFlora>(value: classType, child: Text(classType.name));
          //}).toList()),
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
      TextField(
        onChanged: (value) {
          setState(() {
            valueText = value;
          });
        },
        controller: _sightingsController,
        decoration: const InputDecoration(hintText: "Number spotted"),
        ),
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
                        widget.onListAdded(_nameController, _locationController, _sightingsController, _commentsController);
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
