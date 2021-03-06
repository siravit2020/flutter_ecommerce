import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce/color_plate.dart';
import 'package:flutter_ecommerce/constants.dart';
import 'package:flutter_ecommerce/global_widgets/global_widgets.dart';
import 'package:flutter_ecommerce/loading_screen/loading_page.dart';
import 'package:flutter_ecommerce/text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyLocation extends StatefulWidget {
  @override
  _MyLocationState createState() => _MyLocationState();
}

class _MyLocationState extends State<MyLocation> {
  Set<Marker> _marker = {};
  Marker marker2;
  BitmapDescriptor mapMarker;
  Completer<GoogleMapController> _controller = Completer();
  LatLng location = LatLng(0.0, 0.0);
  Set<Circle> circles;
  String address;
  bool status = false;

  var textAddress = TextEditingController();
  void setCustomMarker() async {
    Uint8List markerIcon = await getBytesFromAsset('assets/image/Slider.png', 80);
    mapMarker = BitmapDescriptor.fromBytes(markerIcon);
    final marker2 = Marker(
      anchor: Offset(0.5, 0.5),
      icon: mapMarker,
      markerId: MarkerId('1'),
      position: location,
    );
    _marker.add(marker2);
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
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png)).buffer.asUint8List();
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
      return Future.error('Location permissions are permantly denied, we cannot request permissions.');
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse && permission != LocationPermission.always) {
        return Future.error('Location permissions are denied (actual value: $permission).');
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

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      body: (status)
          ? SingleChildScrollView(
              child: Column(
                children: [
                  ClipPath(
                    child: SizedBox(
                      height: 1.sh / 2.1,
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
                            style: h30,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 14.h,
                          ),
                          Text(
                            "Move the pin on the map to find your location and select the delivery address.",
                            style: b14.copyWith(color: Colors.black),
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
                                readOnly: true,
                                controller: textAddress,
                                cursorColor: Color(0xffAA7E6F),
                                decoration: decoration.copyWith(
                                  labelText: 'Address',
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(0.0),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                    'assets/icons/location_field.svg',
                                    color: brownGoldColor,
                                  ),
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
                              message: "NEXT",
                              width: 240.w,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Align(
                            child: ButtonFill2(
                              color: brownGoldColor.withOpacity(0.16),
                              fuction: () {
                                Navigator.pushNamed(context, '/newaddress');
                              },
                              message: "ADD IT MANUALLY",
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
            )
          : LoadingPage(
              nextPage: "null",
            ),
    );
  }
}
