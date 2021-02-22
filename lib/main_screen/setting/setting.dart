import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter_ecommerce/color_plate.dart';
import 'package:flutter_ecommerce/global_widgets/global_widgets.dart';
import 'package:flutter_ecommerce/text_style.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

final switchState = StateProvider<bool>((ref) {
  return false;
});
final switchState2 = StateProvider<bool>((ref) {
  return false;
});

class Setting extends ConsumerWidget {
  const Setting({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final w = MediaQuery.of(context).size.width;

    final height = MediaQuery.of(context).size.height - kToolbarHeight;
    final switchChange = watch(switchState);
    final switchChange2 = watch(switchState2);
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          appBar: StandardAppbar(
            title: "SETTING",
          ),
          body: Container(
            width: double.infinity,
            constraints: new BoxConstraints(
              minHeight: height,
            ),
            decoration: whiteCorner,
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
                          height: 41.h,
                        ),
                        title("LANGUAGE", "Change"),
                        SizedBox(
                          height: 14.h,
                        ),
                        Text(
                          "English",
                          style: b14.copyWith(color: Colors.black),
                        ),
                        Divider(
                          thickness: 1,
                          height: 62.h,
                        ),
                        title("PASSWORD", "Change"),
                        SizedBox(
                          height: 14.h,
                        ),
                        Text(
                          "• • • • • • • • • • • • • • • • • • • •",
                          style: b14.copyWith(color: Colors.black),
                        ),
                        Divider(
                          thickness: 1,
                          height: 62.h,
                        ),
                        title("LOCATION", "EDIT"),
                        SizedBox(
                          height: 14.h,
                        ),
                        Text(
                          "Istanbul, TR",
                          style: b14.copyWith(color: Colors.black),
                        ),
                        SizedBox(
                          height: 9.h,
                        ),
                        Divider(
                          thickness: 1,
                          height: 52.h,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: w * 0.08, right: w * 0.08 - 14.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "RECIVE NOTIFICATIONS",
                          style: b14,
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
                    height: 14.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.08),
                    child: Text(
                      (switchChange.state) ? "Enabled" : "Dissbled",
                      style: b14.copyWith(color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 9.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.08),
                    child: Divider(
                      thickness: 1,
                      height: 52.h,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: w * 0.08, right: w * 0.08 - 14.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "RECIVE NOTIFICATIONS",
                          style: b14,
                        ),
                        Transform.scale(
                          scale: 0.6,
                          child: CupertinoSwitch(
                            activeColor: brownGoldColor,
                            value: switchChange2.state,
                            onChanged: (bool value) {
                              switchChange2.state = value;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.08),
                    child: Text(
                      (switchChange2.state) ? "Enabled" : "Dissbled",
                      style: b14.copyWith(color: Colors.black),
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
          style: b14,
        ),
        Text(
          action,
          style: b14.copyWith(color: brownGoldColor),
        ),
      ],
    );
  }
}
