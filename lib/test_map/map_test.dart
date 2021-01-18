import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce/color_plate.dart';
import 'package:flutter_ecommerce/global_widgets/global_widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TestMap extends StatefulWidget {
  @override
  _TestMapState createState() => _TestMapState();
}

class _TestMapState extends State<TestMap> {
  Set<Marker> _marker = {};
  Marker marker2;
  BitmapDescriptor mapMarker;
  Completer<GoogleMapController> _controller = Completer();
  LatLng l = LatLng(0.0, 0.0);
  Set<Circle> circles;
  String address;
  var textAddress = TextEditingController();
  void setCustomMarker() async {
    Uint8List markerIcon =
        await getBytesFromAsset('assets/image/Slider.png', 80);
    mapMarker = BitmapDescriptor.fromBytes(markerIcon);
    final marker2 = Marker(
      anchor: Offset(0.5, 0.5),
      icon: mapMarker,
      markerId: MarkerId('1'),
      position: LatLng(13.810571, 100.692831),
    );
    _marker.add(marker2);
    circles = Set.from([
      Circle(
        circleId: CircleId("1"),
        fillColor: brownGoldColor.withOpacity(0.1),
        strokeColor: Colors.transparent,
        center: LatLng(13.810571, 100.692831),
        radius: 160,
      )
    ]);
    setState(() {});
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
    var first;
    addresses.then((d) {
      print('${d.first.featureName} ${d.first.coordinates}');
    });

    final coordinates = new Coordinates(lan, long);
    addresses = Geocoder.local.findAddressesFromCoordinates(coordinates);

    addresses.then((d) {
      print('${d.first.addressLine}');
      address = d.first.addressLine;
      textAddress.text = address;
      setState(() {});
    });
  }

  @override
  void initState() {
    setCustomMarker();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final w5 = MediaQuery.of(context).size.width / 5;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 370.h + 20.h,
              width: double.infinity,
              child: Center(
                child: GoogleMap(
                  circles: circles,
                  markers: _marker,
                  onTap: (pos) {
                    gett(pos.latitude, pos.longitude);
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

                    _marker.add(m);
                    setState(() {});
                  },
                  initialCameraPosition: CameraPosition(
                    target: LatLng(13.810571, 100.692831),
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
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              width: w,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: w * 0.08),
                child: Column(
                  children: [
                    SizedBox(
                      height: 44.h,
                    ),
                    Text(
                      "Select your location form the map",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30.sp,
                          fontFamily: 'avenirH'),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    Text(
                      "Move the pin on the map to find your location and select the delivery address.",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'avenirB'),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 39.h,
                    ),
                  
                    Stack(
                      alignment: const Alignment(1.0, 1.0),
                      children: [
                          TextField(
                      onChanged: (String msg) {},
                      controller: textAddress,
                      cursorColor: Color(0xffAA7E6F),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffE5E5E5)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFCC9D76)),
                        ),
                        contentPadding: EdgeInsets.only(left: 10.w,right: 50),
                        labelText: 'Address',
                      ),
                    ),
                        Container(
                          padding: const EdgeInsets.all(0.0),
                          child: IconButton(
                            onPressed: () {
                              
                            },
                            icon: SvgPicture.asset('assets/icons/location_field.svg',color: brownGoldColor,),
                            iconSize: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 31.h,
                    ),
                    Align(
                      child: ButtonFill(
                        color: brownGoldColor,
                        fuction: () {
                          Navigator.pop(context);
                        },
                        message: "APPLY",
                        width: 240.w,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Align(
                      child: ButtonFill2(
                        color: brownGoldColor.withOpacity(0.16),
                        fuction: () {},
                        message: "CLEAR FILTER",
                        width: 240.w,
                      ),
                    ),
                    SizedBox(
                      height: 16.5.h,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
