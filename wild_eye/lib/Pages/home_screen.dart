import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:wild_eye/Objects/fauna.dart';
import 'package:wild_eye/Objects/flora.dart';
import 'package:wild_eye/Objects/location.dart';
import 'package:wild_eye/Pages/fauna_list_display.dart';
import 'package:wild_eye/Pages/take_picture.dart';
import 'package:wild_eye/pages/map_display.dart';

import 'flora_list_display.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.theCamera});
  // This widget is the home page of your application
  final theCamera;
  @override
  State<HomeScreen> createState() => _HomeScreenState();

  //CameraDescription getCamera(){
  //return theCamera;
}

class _HomeScreenState extends State<HomeScreen> {
  List<Flora> flora_list = [];
  List<Fauna> fauna_list = [];

  void _handleDeleteItem(Flora flora) {
    setState(() {
      print("Deleting item");
      //_itemSet.remove(item);
      flora_list.remove(flora);
    });
  }

  void _handleNewItem(Flora flora, XFile? xfile) {
    setState(() {
      print("Adding new item");
      //_itemSet.add(item);
      flora_list.add(flora);
    });
  }

  void _handleNewFaunaItem(Fauna fauna, XFile? xfile) {
    setState(() {
      fauna_list.add(fauna);
    });
  }

  void _handleDeleteFaunaItem(Fauna fauna) {
    setState(() {
      fauna_list.remove(fauna);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Wild-Eye')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: ElevatedButton(
              onPressed: () async {
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FloraList(
                      camera: widget.theCamera,
                      items: flora_list,
                      onDeleteItem: _handleDeleteItem,
                      onListAdded: _handleNewItem,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              )),
              child: Text('Flora',
                  style: new TextStyle(
                    fontSize: 35.0,
                  )),
            )),
            SizedBox(height: 10),
            Expanded(
                child: ElevatedButton(
              onPressed: () async {
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FaunaList(
                      camera: widget.theCamera,
                      items: fauna_list,
                      onDeleteItem: _handleDeleteFaunaItem,
                      onListAdded: _handleNewFaunaItem,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              )),
              child: Text('Fauna',
                  style: new TextStyle(
                    fontSize: 35.0,
                  )),
            )),
            Row(children: [
              ElevatedButton(
                  onPressed: () async {
                    await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MapDisplay(),
                      ),
                    );
                  },
                  child: const Icon(Icons.location_on)),
            ])
          ],
        ),
      ),
    );
  }
}

// class FloraFaunaButtons extends StatelessWidget {
//   const FloraFaunaButtons({super.key, required this.camera});

//   final CameraDescription camera;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         //mainAxisSize: MainAxisSize.max,
//         children: <Widget>[
//           ElevatedButton(
//               onPressed: () async {
//                 await Navigator.of(context).push(
//                   MaterialPageRoute(
//                       builder: (context) => FloraList(
//                       camera: widget.theCamera,
//                       items: flora_list,
//                       onDeleteItem: _handleDeleteItem,
//                       onListAdded: _handleNewItem,
//                           )),
//                 );
//               },
//               child: const Text('Flora')),
//           ElevatedButton(
//               onPressed: () async {
//                 await Navigator.of(context).push(
//                   MaterialPageRoute(
//                       builder: (context) => FaunaList(camera: camera)),
//                 );
//               },
//               child: const Text('Fauna')),
//           ElevatedButton(
//               onPressed: () async {
//                 await Navigator.of(context).push(
//                   MaterialPageRoute(
//                       builder: (context) => TakePictureScreen(camera: camera)),
//                 );
//               },
//               child: const Text('Take Pic'))
//         ]);
//   }
// }

// class ButtonSection extends StatelessWidget {
//   const ButtonSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: <Widget>[
//           ElevatedButton(
//               onPressed: () {}, child: const Icon(Icons.location_on)),
//           ElevatedButton(
//             onPressed: () {},
//             child: const Icon(Icons.add),
//           ),
//           //ElevatedButton(onPressed: (){},
//           //child: const Icon(Icons.camera),),
//         ]);
//   }
// }
