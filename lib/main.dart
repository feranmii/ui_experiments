import 'package:flutter/material.dart';
import 'package:ui_experiments/NavBar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int opened = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        elevation: 0,
        title: Text(widget.title),
      ),*/
      backgroundColor: Colors.black87,

      bottomNavigationBar: NavBar(
          Colors.black87,
          Colors.white,
          ["Home", "Search", "Messages", "Account"],
          [
            Icon(Icons.home_rounded, color: Colors.grey,size: 33,),
            Icon(Icons.search_rounded, color: Colors.grey,size: 33),
            Icon(Icons.send_rounded, color: Colors.grey,size: 33),
            Icon(Icons.person_rounded, color: Colors.grey,size: 33),
          ],
          opened, (i) {
        setState(() {
          opened = i;
        });
      }),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.

      ),

    );
  }
}
