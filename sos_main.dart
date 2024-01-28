import 'package:background_sms/background_sms.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  Position? _currentPosition;
  Position? _currentAddress;
  LocationPermission? _permission;

  _getPermission() async => await [Permission.sms].request();
  _isPermissionGranted() async => await Permission.sms.status.isGranted;
  _sendSMS(String phoneNumber, String message,{int? simSlot}) async{
    await BackgroundSms.sendMessage(
        phoneNumber: phoneNumber,
        message: message,
        simSlot: simSlot,
    ).then((status) {
      if(status == "sent"){
        Fluttertoast.showToast(msg: "sent");
      }
      else{
        Fluttertoast.showToast(msg: "failed");
      }
    });
  }
  _getCurrentLocation() async{
    _permission = await Geolocator.checkPermission();
    if(_permission==LocationPermission.denied){
      _permission = await Geolocator.requestPermission();
      Fluttertoast.showToast(msg: "Location permissions are denied");
      if(_permission == LocationPermission.deniedForever){
        Fluttertoast.showToast(
            msg: "Location permissions are permanently denied");
      }
    }
    Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
      forceAndroidLocationManager: true)
        .then((Position position) {
          setState(() {
            _currentPosition=position;
            _getAddressFromLatLon();
          });
    }).catchError((e){
      Fluttertoast.showToast(msg: e.toString());
    });
  }

  _getAddressFromLatLon() async{

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("SEND YOUR LOCATION IMMEDIATELY"),
            ElevatedButton(
                onPressed: (){},

                child:Text("Send Alert"),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: (){},
              child:Text("Send Location"),
            ),
          ],
        ),
      ),
    );
  }
}

