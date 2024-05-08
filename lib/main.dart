import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class FavoriteBox extends StatefulWidget {
  const FavoriteBox({super.key});
  @override
  State<FavoriteBox> createState() => _FavoriteBoxState();
}

class _FavoriteBoxState extends State<FavoriteBox> {
  //bool _favoriteBorder = true;
  bool _favoriteTapped = false;
  double _size = 100;

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _favoriteTapped = !_favoriteTapped;
        });
      },
      child: Text(
        _favoriteTapped ? 'Hello' : 'Hello',
        style: TextStyle(
          fontSize: _favoriteTapped ? 40.0 : 20.0,
          color: _favoriteTapped ? Colors.red : Colors.green,
        ),
      ),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
// return object of type Dialog
        return AlertDialog(
          title: const Text("Message"),
          content: const Text("Hello World"),
          actions: <Widget>[
            TextButton(
              child: const Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(child: FavoriteBox()),
    );
  }
}
