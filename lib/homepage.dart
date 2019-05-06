import 'package:flutter/material.dart';
import 'package:heart_tracker/bluetoothDevice/bluetoothDevice.dart';
import 'package:heart_tracker/bluetoothDevice/bluetoothPage.dart';
import 'package:heart_tracker/homepage/BluetoothDeviceDisplay.dart';
import 'BluetoothBloc.dart';
FlutterBlueDevice blueDev = new FlutterBlueDevice();
bool isBlueAvailable = false;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BluetoothBloc blueDev = new BluetoothBloc();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          new IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FlutterBlueApp()),
                );
              },
              icon: Icon(Icons.bluetooth))
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            DeviceSection(blueDev: blueDev,),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
