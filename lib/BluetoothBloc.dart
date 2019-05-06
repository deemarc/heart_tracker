import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:flutter_blue/flutter_blue.dart';

class BluetoothBloc {
  // Observable Properties
  BehaviorSubject<BluetoothState> _subjectState;
  Observable<BluetoothState> get stateObservable => _subjectState.stream;
  StreamSubscription _stateSubscription;

  // internal
  BluetoothState initialState = BluetoothState.unknown;
  FlutterBlue _flutterBlue = FlutterBlue.instance;
  // constructor
  BluetoothBloc() {
    _flutterBlue.state.then((s) {
      this.initialState = s;
    });
    this.initialState = BluetoothState.unknown;
    _subjectState =
        new BehaviorSubject<BluetoothState>.seeded(this.initialState);
  }

  void dispose() {
    _subjectState.close();
    // _stateSubscription.close();
  }
}
