import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce/color_plate.dart';
import 'package:flutter_ecommerce/global_widgets/global_widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyAddress extends ConsumerWidget {
  const MyAddress({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final w = MediaQuery.of(context).size.width;
    final w5 = MediaQuery.of(context).size.width / 5;
    final height = MediaQuery.of(context).size.height - kToolbarHeight;
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
              "MY ADDRESS",
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
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.08),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        detailsOrder("HOME ADDRESS",
                            "Dereboyu Cad. 23, \n34410 - Istanbul/Türkiye"),
                        Divider(
                          thickness: 1,
                          height: 62,
                        ),
                        detailsOrder("WORK ADDRESS",
                            "Dereboyu Cad. 23, \n34410 - Istanbul/Türkiye"),
                        Divider(
                          thickness: 1,
                          height: 62,
                        ),
                        SizedBox(
                          height: 60,
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16.5,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: FlatButton(
                      minWidth: w5 * 3,
                      padding: EdgeInsets.fromLTRB(20, 12, 20, 12),
                      onPressed: () {},
                      color: brownGoldColor,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0),
                      ),
                      child: Text(
                        "ADD ANOTHER ADDRESS",
                        style: TextStyle(
                          letterSpacing: 1.5,
                          fontSize: 13,
                          fontFamily: 'avenirM',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Column detailsOrder(String title, String address) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
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
              "Change",
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'avenirB',
                color: brownGoldColor,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 24,
        ),
        Container(
          width: 200,
          child: Text(
            address,
            style: TextStyle(
              height: 1.4,
              fontSize: 14,
              fontFamily: 'avenirB',
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
