import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

class callInFlutter extends StatefulWidget {
  const callInFlutter({super.key});

  @override
  State<callInFlutter> createState() => _callInFlutterState();
}

class _callInFlutterState extends State<callInFlutter> {

  Uri dialnumber = Uri(scheme: 'tel', path:'9812370346');

  callnumber()async{
    await launchUrl(dialnumber);
  }

  directcall()async{
    await FlutterPhoneDirectCaller.callNumber('9812370346');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Emergency Call'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton.icon(
            onPressed: callnumber,
            icon: Icon(Icons.call),
            label: Text('Call')
        ),
      ),
    );
  }
}
