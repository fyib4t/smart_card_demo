# smart_card

JavaScript File (smart_card.js)
Create a file named smart_card.js with the following content:

async function connectSmartCardReader() {
    try {
        const device = await navigator.usb.requestDevice({ filters: [{ vendorId: 0x1234 }] });
        await device.open();
        console.log('Device opened:', device);
        console.log('Device serial number:', device.serialNumber);
        // Add more code to interact with the device
    } catch (error) {
        console.error('Error connecting to smart card reader:', error);
    }
}

Modify index.html
In your Flutter web project, locate the web/index.html file and include the JavaScript file:

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Flutter Demo</title>
    <script src="smart_card.js"></script>
</head>
<body>
    <script src="main.dart.js" type="application/javascript"></script>
</body>
</html>


Flutter Code (lib/main.dart)
In your Flutter project, use the dart:js package to call the JavaScript function. Here is the complete example:

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

Complete Folder Structure
Your folder structure should look like this:

flutter_project/
│
├── lib/
│   └── main.dart
├── web/
│   ├── index.html
│   └── smart_card.js
├── pubspec.yaml


Adding Dependencies
Add the dart:js package to your pubspec.yaml file:

https://pub.dev/packages/js

Running the Application
Run the Flutter web application with the following command:

flutter run -d chrome


Expected Outcome
When you click the "Connect Smart Card Reader" button, the application should attempt to connect to the smart card reader using the WebUSB API and log the device's serial number to the browser console. Open the browser console (usually by pressing F12 or Ctrl+Shift+I) to view the logs.

If you encounter any issues or need further assistance, feel free to ask!
