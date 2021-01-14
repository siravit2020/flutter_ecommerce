import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce/color_plate.dart';
import 'package:flutter_ecommerce/global_widgets/global_widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_custom_switch/flutter_custom_switch.dart';

final switchState = StateProvider<bool>((ref) {
  return false;
});

class Setting extends ConsumerWidget {
  const Setting({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final w = MediaQuery.of(context).size.width;
    final w5 = MediaQuery.of(context).size.width / 5;
    final height = MediaQuery.of(context).size.height - kToolbarHeight;
    final switchChange = watch(switchState);
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
              splashRadius: 20,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: SvgPicture.asset(
                'assets/icons/backArrow.svg',
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.black,
            title: Text(
              "SETTING",
              style: TextStyle(
                  fontSize: 13, fontFamily: 'avenirB', color: Colors.white),
            ),
          ),
          body: Container(
            width: double.infinity,
            constraints: new BoxConstraints(
              minHeight: height,
            ),
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(20.0),
                topRight: const Radius.circular(20.0),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.08),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 41,
                        ),
                        title("LANGUAGE", "Change"),
                        SizedBox(
                          height: 14,
                        ),
                        Text(
                          "English",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'avenirB',
                            color: Colors.black,
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          height: 62,
                        ),
                        title("PASSWORD", "Change"),
                        SizedBox(
                          height: 14,
                        ),
                        Text(
                          "• • • • • • • • • • • • • • • • • • • •",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'avenirB',
                            color: Colors.black,
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          height: 62,
                        ),
                        title("LOCATION", "EDIT"),
                        SizedBox(
                          height: 14,
                        ),
                        Text(
                          "Istanbul, TR",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'avenirB',
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        Divider(
                          thickness: 1,
                          height: 52,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: w * 0.08, right: w * 0.08 - 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "RECIVE NOTIFICATIONS",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'avenirB',
                            color: textGrey,
                          ),
                        ),
                        Transform.scale(
                          scale: 0.6,
                          child: CupertinoSwitch(
                            activeColor: brownGoldColor,
                            value: switchChange.state,
                            onChanged: (bool value) {
                              switchChange.state = value;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.08),
                    child: Text(
                     (switchChange.state)?"Enabled":"Dissbled",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'avenirB',
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.08),
                    child: Divider(
                      thickness: 1,
                      height: 52,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: w * 0.08, right: w * 0.08 - 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "RECIVE NOTIFICATIONS",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'avenirB',
                            color: textGrey,
                          ),
                        ),
                        Transform.scale(
                          scale: 0.6,
                          child: CupertinoSwitch(
                            activeColor: brownGoldColor,
                            value: !switchChange.state,
                            onChanged: (bool value) {
                              switchChange.state = value;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.08),
                    child: Text(
                      (switchChange.state)?"Enabled":"Dissbled",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'avenirB',
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Row title(String title, String action) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'avenirB',
            color: textGrey,
          ),
        ),
        Text(
          action,
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'avenirB',
            color: brownGoldColor,
          ),
        ),
      ],
    );
  }
}
