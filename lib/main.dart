import 'dart:js' as js;
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  void connectSmartCardReader() {
    js.context.callMethod('connectSmartCardReader');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Smart Card Reader Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: connectSmartCardReader,
          child: Text('Connect Smart Card Reader'),
        ),
      ),
    );
  }
}
