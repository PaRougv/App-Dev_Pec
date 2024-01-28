import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PolygoneScreen extends StatefulWidget {
  const PolygoneScreen({super.key});


  @override
  State<PolygoneScreen> createState() => _PolygoneScreenState();
}

class _PolygoneScreenState extends State<PolygoneScreen> {

  Completer<GoogleMapController> _controller = Completer();

  CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(13.0203871,80.0869064),
      zoom: 12
  );

  final Set<Marker> _markers = {};
  Set<Polygon> _polygone = HashSet<Polygon>();

  List<LatLng> points =[
    LatLng(13.0203871,80.0869064),
    LatLng(13.0163753,80.0546694),
    LatLng(13.1277049,80.0462489),
  ];


  @override

  void initState(){
    super.initState();

    _polygone.add(
      Polygon(polygonId: PolygonId('1'),
      points: points,
        fillColor: Colors.red.withOpacity(0.3),
        geodesic: true,
        strokeWidth: 4,
        strokeColor: Colors.deepOrange,
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Polygon'),),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        myLocationButtonEnabled: true,
        myLocationEnabled: false,
        polygons: _polygone,


        onMapCreated: (GoogleMapController controller){
          _controller.complete(controller);
        },
      ),
    );
  }
}
