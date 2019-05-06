import 'package:flutter/material.dart';
import 'package:heart_tracker/bluetoothDevice/bluetoothDevice.dart';
import 'package:heart_tracker/BluetoothBloc.dart';
import 'package:flutter_blue/flutter_blue.dart';

class DeviceSection extends StatefulWidget{
  final BluetoothBloc blueDev;
  DeviceSection({Key key, @required this.blueDev}) : super(key:key);
  @override
  State<StatefulWidget> createState() => _DeviceSectionState();

}

class _DeviceSectionState extends State<DeviceSection> {

  @override
  Widget build(BuildContext context) {
    return Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          /*1*/
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*2*/
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'Beaglebone Watch',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              new StreamBuilder(
                stream: widget.blueDev.stateObservable,
                builder: 
                (context, AsyncSnapshot<BluetoothState> snapshot){
                  return new Text('${snapshot.data}',
                        style: Theme.of(context).textTheme.display1
                        );
                }

              )
                // builder: (context, AsyncSnapshot<int> snapshot) {
                //     return new Text('${snapshot.data}',
                //         style: Theme.of(context).textTheme.display1);
                //   }),
            ],
          ),
        ),
        /*3*/
//
//        FavoriteWidget(),
      Icon(Icons.bluetooth_disabled),
      ],
    ),
  );
  }

}
