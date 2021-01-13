import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce/color_plate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../test5.dart';

class VerifiedPage extends ConsumerWidget {
  const VerifiedPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final w5 = MediaQuery.of(context).size.width / 5;
    final height = MediaQuery.of(context).size.height - kToolbarHeight;

    return Scaffold(
        body: Container(
      width: double.infinity,
      constraints: new BoxConstraints(
        minHeight: height,
      ),
      color: Colors.white,
      child: Stack(
        children: [
          Positioned(
            top: kToolbarHeight,
            right: 18,
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: SvgPicture.asset('assets/icons/close.svg'),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RipplesAnimation(
                      icon: 'verified.svg',
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Phone verified",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontFamily: 'avenirB'),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                        "Congratulations, your phone number has been \n verified. You can now start using the app.",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'avenirB',
                        ),
                        textAlign: TextAlign.center),
                  ],
                ),
              ),
              FlatButton(
                minWidth: w5 * 3,
                padding: EdgeInsets.fromLTRB(20, 12, 20, 12),
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                color: brownGoldColor,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22.0),
                ),
                child: Text(
                  "CONTINUED",
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'avenirM',
                    letterSpacing: 2,
                  ),
                ),
              ),
              SizedBox(
                height: 16.5,
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
