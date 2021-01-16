import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce/color_plate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;
import 'package:geocoder/geocoder.dart';

class MapFull extends StatefulWidget {
  @override
  State<MapFull> createState() => MapFullState();
}

class MapFullState extends State<MapFull> {
  Set<Marker> _marker = {};
  Marker marker2;
  BitmapDescriptor mapMarker;
  Completer<GoogleMapController> _controller = Completer();
  LatLng l = LatLng(0.0, 0.0);
  Set<Circle> circles;

  void setCustomMarker() async {
    Uint8List markerIcon =
        await getBytesFromAsset('assets/image/Slider.png', 80);
    mapMarker = BitmapDescriptor.fromBytes(markerIcon);
  }

  Future<String> _calculation = Future<String>.delayed(
    Duration(seconds: 2),
    () => 'Data Loaded',
  );
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permantly denied, we cannot request permissions.');
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return Future.error(
            'Location permissions are denied (actual value: $permission).');
      }
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
        .buffer
        .asUint8List();
  }

  @override
  void initState() {
    setCustomMarker();
    super.initState();
  }

  void gett(double lan, double long) async {
    final query = "74/253 รามอินทรา";
    var addresses = Geocoder.local.findAddressesFromQuery(query);
    var first;
    addresses.then((d) {
   
      print('${d.first.featureName} ${d.first.coordinates}');
    });
    

    final coordinates = new Coordinates(lan, long);
    addresses = Geocoder.local.findAddressesFromCoordinates(coordinates);

    addresses.then((d) {

      print('${d.first.addressLine}');
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: FutureBuilder<Position>(
        future: _determinePosition(),
        builder: (BuildContext context, AsyncSnapshot<Position> snapshot) {
          if (snapshot.hasData) {
            print(Random().nextInt(2));
            gett(snapshot.data.latitude, snapshot.data.longitude);
            marker2 = Marker(
              anchor: Offset(0.5, 0.5),
              icon: mapMarker,
              markerId: MarkerId('1'),
              position: LatLng(snapshot.data.latitude, snapshot.data.longitude),
            );
            final marker3 = Marker(
              anchor: Offset(0.5, 0.5),
              icon: mapMarker,
              markerId: MarkerId('2'),
              position: LatLng(snapshot.data.latitude + 0.001,
                  snapshot.data.longitude + 0.002),
            );
            _marker.add(marker2);
            _marker.add(marker3);
            return GoogleMap(
              circles: Set.from([
                Circle(
                  circleId: CircleId("1"),
                  fillColor: brownGoldColor.withOpacity(0.1),
                  strokeColor: Colors.transparent,
                  center:
                      LatLng(snapshot.data.latitude, snapshot.data.longitude),
                  radius: 160,
                )
              ]),
              markers: _marker,
              onTap: (pos) {
                Marker m = Marker(
                  anchor: Offset(0.5, 0.5),
                  icon: mapMarker,
                  markerId: MarkerId('1'),
                  position: pos,
                );
                circles = Set.from([
                  Circle(
                    circleId: CircleId("1"),
                    fillColor: brownGoldColor.withOpacity(0.1),
                    strokeColor: Colors.transparent,
                    center: pos,
                    radius: 160,
                  )
                ]);
                setState(() {
                  _marker.add(m);
                });
              },
              initialCameraPosition: CameraPosition(
                target: LatLng(snapshot.data.latitude, snapshot.data.longitude),
                zoom: 14.4746,
              ),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            );
          } else
            return SizedBox();
        },
      ),
    );
  }
}
