import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  // to capture the lifecyle state changes we use the mixin WigestBindingObserver

  AppLifecycleState _appLifecycleState; // _ is private
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      _appLifecycleState = state;
      print("My App State: $_appLifecycleState");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: OrientationBuilder(builder: (context, orientation) {
          return Center(
            child: Text(_appLifecycleState.toString(),
                style: TextStyle(
                    fontSize: 22.4,
                    color: orientation == Orientation.portrait
                        ? Colors.blue
                        : Colors.red)),
          );
        }),
      ),
    );
  }
}
