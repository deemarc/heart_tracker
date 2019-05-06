import 'dart:async';
import 'package:flutter_blue/flutter_blue.dart';



class FlutterBlueDevice {

  FlutterBlue _flutterBlue = FlutterBlue.instance;
  BluetoothState state = BluetoothState.unknown;

  FlutterBlueDevice()
  {
    _flutterBlue.state.then((s) {
        state = s;
    });

  }
}