import 'package:flutter/material.dart';
import 'package:wild_eye/objects/flora.dart';
import 'package:wild_eye/objects/fauna.dart';
import 'package:wild_eye/widgets/fauna_list.dart';
import 'package:wild_eye/widgets/flora_list.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WildEye',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 25, 140, 29)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Home'),
    );
  }
}



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  // This widget is the home page of your application
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class FloraList extends StatefulWidget {
  const FloraList({super.key});

  @override
  State<FloraList> createState() => _FloraListState();
}

class _FloraListState extends State<FloraList> {
  @override
  Widget build(BuildContext context) {
    return const Column(mainAxisSize: MainAxisSize.max, children: [
      SingleChildScrollView(child: Text('flora'),),
    ],);
  }
}
class FaunaList extends StatefulWidget {
  const FaunaList({super.key});

  @override
  State<FaunaList> createState() => _FaunaListState();
}

class _FaunaListState extends State<FaunaList> {
  @override
  Widget build(BuildContext context) {
    return const Column(mainAxisSize: MainAxisSize.max, children: [
      SingleChildScrollView(child: Text('fauna'),),
    ],);
  }
}


class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;
    return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(onPressed: () {},
                child: const Icon(Icons.location_on)),
                ElevatedButton(onPressed: (){},
                child: const Icon(Icons.add),),
              ]
            );
  
    
  }
}

class _MyHomePageState extends State<MyHomePage> {
  //final List<flora> floralist;
  //final _floraSet = <flora>{};
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Wild-Eye')
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FloraList(),
            FaunaList(),
            ButtonSection(),
            ],
        ),
       
      ),
      
    );
  }

}