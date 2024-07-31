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

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _idCardData = 'No data';

  void connectSmartCardReader() async {
    var dataPromise = js.context.callMethod('connectSmartCardReader');
    dataPromise.then((data) {
      setState(() {
        _idCardData = data;
      });
    }).catchError((error) {
      setState(() {
        _idCardData = 'Error: $error';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Smart Card Reader Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: connectSmartCardReader,
              child: Text('Connect Smart Card Reader'),
            ),
            SizedBox(height: 20),
            Text(
              _idCardData,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
