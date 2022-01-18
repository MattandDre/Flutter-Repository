import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Virtual Proposal';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  void _closeDrawer() {
    Navigator.of(context).pop();
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text("Let's not stop the car...🚗"),
        content: const Text('Can you please hug me now?🥺'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
              child: const Text('Yes!'),
              onPressed: (){
                Navigator.pop(context);
              },
          )
        ]
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[200],
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('I love you, Audrey!'),
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _openDrawer,
          child: const Image(
            image: AssetImage('images/IMG_9460.heic'),
          ),
        ),
      ),
      drawer: Drawer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Will you please keep me with you forever?'),
              ElevatedButton(
                onPressed: _closeDrawer,
                child: const Text('I will.'),
              ),
            ],
          ),
        ),
      ),
      // Disable opening the drawer with a swipe gesture.
      drawerEnableOpenDragGesture: false,
    );
  }
}

/*
import 'package:flutter/material.dart';

void _openDrawer() {
  _scaffoldKey.currentState!.openDrawer();
}

void _closeDrawer() {
  Navigator.of(context).pop();
}

//The main function is the starting point of all our Flutter Apps.
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('I love you, Audrey!'),
          backgroundColor: Colors.pink,
        ),
        backgroundColor: Colors.pink[200],
        body: Center(
          child: ElevatedButton(
            onPressed: _openDrawer,
            child: const Image(
              image: AssetImage('images/IMG_9460.heic'),
            ),
          ),
        ),
      ),
    ),
  );
}*/
