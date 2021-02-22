import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce/color_plate.dart';
import 'package:flutter_ecommerce/loading_screen/loading_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MapFull extends StatefulWidget {
  @override
  _MapFullState createState() => _MapFullState();
}

class _MapFullState extends State<MapFull> {
  Set<Marker> _marker = {};
  Marker marker2;
  BitmapDescriptor mapMarker;
  BitmapDescriptor mapMarker2;
  Completer<GoogleMapController> _controller = Completer();
  LatLng location = LatLng(0.0, 0.0);
  Set<Circle> circles;
  String address;
  bool status = false;

  var textAddress = TextEditingController();
  void setCustomMarker() async {
    Uint8List markerIcon =
        await getBytesFromAsset('assets/image/Slider.png', 80);
    Uint8List markerIcon2 =
        await getBytesFromAsset('assets/image/Various-Store.png', 100);
    mapMarker = BitmapDescriptor.fromBytes(markerIcon);

    mapMarker2 = BitmapDescriptor.fromBytes(markerIcon2);
    final marker2 = Marker(
      anchor: Offset(0.5, 0.5),
      icon: mapMarker,
      markerId: MarkerId('1'),
      position: location,
    );
    _marker.add(marker2);
    for (int i = 2; i < 7; i++) {
      var m = Marker(
        anchor: Offset(0.5, 0.5),
        icon: mapMarker2,
        markerId: MarkerId('$i'),
        position: LatLng(
            location.latitude + (0.001 * randomDoubleInRange(min: 0.0, max: 20.0)),
            location.longitude + (0.001 * randomDoubleInRange(min: 0.0, max: 20.0))),
      );
      _marker.add(m);
    }
    circles = Set.from([
      Circle(
        circleId: CircleId("1"),
        fillColor: brownGoldColor.withOpacity(0.1),
        strokeColor: Colors.transparent,
        center: location,
        radius: 160,
      )
    ]);
    gett(location.latitude, location.longitude);
    //setState(() {});
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

  void gett(double lan, double long) async {
    final query = "74/253 รามอินทรา";
    var addresses = Geocoder.local.findAddressesFromQuery(query);
    addresses.then((d) {
      print('${d.first.featureName} ${d.first.coordinates}');
    });

    final coordinates = new Coordinates(lan, long);
    addresses = Geocoder.local.findAddressesFromCoordinates(coordinates);

    addresses.then((d) {
      print('${d.first.addressLine}');
      print('${d.first.countryName}');
      print('${d.first.adminArea}');
      print('${d.first.postalCode}');
      print('${d.first.featureName}');
      print('${d.first.thoroughfare}');

      address = d.first.addressLine;
      textAddress.text = address;
      setState(() {});
    });
  }

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

  @override
  void initState() {
    _determinePosition().then((value) {
      location = LatLng(value.latitude, value.longitude);
      status = true;
      setCustomMarker();
    });
 
    super.initState();
  }

  double randomDoubleInRange({double min = 0.0, double max = 1.0}) {
    return Random().nextDouble() * (max - min + 1) + min;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
        splashRadius: 20,
        onPressed: () {
          Navigator.pop(context);
        },
        icon: SvgPicture.asset(
          'assets/icons/backArrow.svg',
          color: Colors.black,
          width: 20.w,
        ),
      ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      body: (status)
          ? Center(
              child: GoogleMap(
                circles: circles,
                markers: _marker,
                onTap: (pos) {
                  print(pos);
                },
                initialCameraPosition: CameraPosition(
                  target: location,
                  zoom: 14.4746,
                ),
                gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
                  new Factory<OneSequenceGestureRecognizer>(
                    () => new EagerGestureRecognizer(),
                  ),
                ].toSet(),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            )
          : LoadingPage(
              nextPage: "null",
            ),
    );
  }
}
