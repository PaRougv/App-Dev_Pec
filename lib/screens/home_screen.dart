import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{

  Completer<GoogleMapController> _controller = Completer();
   CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(12.8438495, 80.1522864),
    zoom: 13,
  );

  List<Marker> _marker = [];
  final List<Marker> _list = const [
    Marker(
      markerId: MarkerId('1'),
      position: LatLng(13.0489101, 80.0728893),
      // icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
      infoWindow: InfoWindow(
        title: 'My Location',
      ),
    ),
    Marker(
        markerId: MarkerId('2'),
        position: LatLng(13.049194,80.0516804),
        infoWindow: InfoWindow(
          title: 'Relief Shelter-1 Location',
        ),
    ),

    Marker(
        markerId: MarkerId('3'),
        position: LatLng(13.0341089,79.993946),
        infoWindow: InfoWindow(
          title: 'Food Shelter-1 Location',
        ),
    ),

    Marker(
      markerId: MarkerId('4'),
      position: LatLng(13.072090,80.201860),
      infoWindow: InfoWindow(
        title: 'Food Shelter-2 Location',
      ),
    ),

    Marker(
      markerId: MarkerId('5'),
      position: LatLng(13.1277049,80.0462489),
      infoWindow: InfoWindow(
        title: 'Relief Shelter-2 Location',
      ),

    ),
    Marker(
      markerId: MarkerId('6'),
      position: LatLng(13.0083863,80.0052751),
      infoWindow: InfoWindow(
        title: 'Flooding spots-1',
      ),
    ),
    Marker(
      markerId: MarkerId('7'),
      position: LatLng(13.0886303,79.8987262),
      infoWindow: InfoWindow(
        title: 'Flooding spots-2',
      ),
    ),
    Marker(
      markerId: MarkerId('8'),
      position: LatLng(13.1205616,80.1763309),
      infoWindow: InfoWindow(
        title: 'Flooding spots-3',
      ),
    ),
    Marker(
      markerId: MarkerId('9'),
      position: LatLng(13.0415119,80.0194281),
      infoWindow: InfoWindow(
        title: 'Relief Shelter-3 Location',
      ),
    ),
  ];


  final Set<Marker> _markers = {};
  Set<Polygon> _polygone = HashSet<Polygon>();

  List<LatLng> points_1 =[
    LatLng(13.1141294,80.047586),
    LatLng(13.1583125,80.0277222),
    LatLng(13.1732707,80.2333597),
    LatLng(13.0067291,80.2203166),
    LatLng(13.0135904,80.1250244),

  ];

  List<LatLng> points_2=[
    LatLng(13.0992942,80.049788),
    LatLng(13.00268,80.0761816),
    LatLng(12.9843473,80.0005834),
    LatLng(13.0341089,79.993946),
    LatLng(13.0977365,80.0114646),
  ];

  List<LatLng> points_3=[
    LatLng(13.1301611,79.7349848),
    LatLng(12.941373,79.88701813),
    LatLng(12.7958569,79.8086786),
    LatLng(12.8184556,79.6843589),
    LatLng(13.0163896,79.7028706),
  ];

  List<LatLng> points_4=[
    LatLng(13.0747392,79.9614376),
    LatLng(13.1547874,80.0119217),
    LatLng(13.1726442,79.9433404),
    LatLng(13.1106931,79.9058753),
    LatLng(13.0592283,79.9159853),
    LatLng(13.0700048,80.0730567),
    LatLng(13.00268,80.0761816),
  ];

  List<LatLng> points_5=[
    LatLng(13.1583235,80.0850639),
    LatLng(13.1951408,80.1617963),
    LatLng(13.3219872,80.0999038),
    LatLng(13.2580954,80.0069501),
    LatLng(13.1722422,80.0577624),
  ];

  List<LatLng> points_6=[
    LatLng(13.1730223,79.9261331),
    LatLng(13.1357761,79.8386164),
    LatLng(13.1993058,79.7912604),
    LatLng(13.2605492,79.8170733),
    LatLng(13.2483549,79.9072152),
  ];


  final Set<Polyline>_polyline={};
  List<LatLng> latlng=[
    LatLng(13.0489101, 80.0728893),
    LatLng(13.049194,80.0516804),
    LatLng(13.0341089,79.993946),
    LatLng(13.0415119,80.0194281),
  ];

  @override
  void initState(){
    super.initState();

    for(int i=0;i<latlng.length;i++){
      _markers.add(
        Marker(
          markerId: MarkerId(i.toString()),
        position:latlng[i],
        infoWindow:InfoWindow(
          title: 'Start here',
        ),
          icon: BitmapDescriptor.defaultMarker,
        )
      );
      setState(() {

      });
      _polyline.add(
        Polyline(polylineId: PolylineId('1'),
          points: latlng,
          color: Colors.orange,
        )
      );
    }

    _marker.addAll(_list);


    _polygone.add(
        Polygon(polygonId: PolygonId('1'),
          points: points_1,
          fillColor: Colors.red.withOpacity(0.3),
          geodesic: true,
          strokeWidth: 4,
          strokeColor: Colors.deepOrange,
        ),
    );
    _polygone.add(
      Polygon(polygonId: PolygonId('5'),
        points: points_5,
        fillColor: Colors.red.withOpacity(0.3),
        geodesic: true,
        strokeWidth: 4,
        strokeColor: Colors.deepOrange,
      ),
    );
    _polygone.add(
      Polygon(polygonId: PolygonId('2'),
        points: points_2,
        fillColor: Colors.yellow.withOpacity(0.5),
        geodesic: true,
        strokeWidth: 4,
        strokeColor: Colors.deepOrange,
      ),
    );
    _polygone.add(
      Polygon(polygonId: PolygonId('4'),
        points: points_4,
        fillColor: Colors.yellow.withOpacity(0.5),
        geodesic: true,
        strokeWidth: 4,
        strokeColor: Colors.deepOrange,
      ),
    );
    _polygone.add(
      Polygon(polygonId: PolygonId('3'),
        points: points_3,
        fillColor: Colors.green.withOpacity(0.5),
        geodesic: true,
        strokeWidth: 4,
        strokeColor: Colors.deepOrange,
      ),
    );
    _polygone.add(
      Polygon(polygonId: PolygonId('6'),
        points: points_6,
        fillColor: Colors.green.withOpacity(0.5),
        geodesic: true,
        strokeWidth: 4,
        strokeColor: Colors.deepOrange,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: _kGooglePlex,
          mapType: MapType.normal,
          myLocationEnabled: true,
          compassEnabled: true,
          polygons: _polygone,

          onMapCreated: (GoogleMapController controller){
            _controller.complete(controller);
          },
          polylines: _polyline,
          markers: Set<Marker>.of(_marker),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.location_disabled_outlined),
        onPressed: () async{
          GoogleMapController controller= await _controller.future;
          controller.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(
                target: LatLng(13.0489101, 80.0728893),
              zoom: 14
            )
          ));
          setState(() {

          });
        },
      ),
    );
  }
}
