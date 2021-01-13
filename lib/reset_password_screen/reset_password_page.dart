import 'dart:ui';
import 'package:flutter_ecommerce/global_widgets/global_widgets.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce/color_plate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';


class ResetPassword extends ConsumerWidget {
  const ResetPassword({Key key}) : super(key: key);

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
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/backArrow.svg',
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.black,
          title: Text(
            "LOG IN",
            style: TextStyle(
              fontSize: 13,
              fontFamily: 'avenirB',
              color: Colors.white,
              letterSpacing: 1.5,
            ),
          ),
        ),
        body: Container(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      height: 34.5,
                    ),
                    Text(
                      "Forgot your password?",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontFamily: 'avenirH'),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        "Enter your email address and we will send you \n instructions on how to reset your password.",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'avenirB',
                        ),
                        textAlign: TextAlign.center),
                    SizedBox(
                      height: 49.5,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: w * 0.08),
                      child: TextField(
                        cursorColor: Color(0xffAA7E6F),
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffE5E5E5)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFCC9D76)),
                          ),
                          contentPadding: EdgeInsets.only(left: 10),
                          labelText: 'Email address',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
              ButtonFill(
                fuction: () {
                  Navigator.pushNamed(context, '/sendemail');
                },
                color: brownGoldColor,
                message: "RECOVER EMAIL",
                width: w5 * 3,
              ),
              SizedBox(
                height: 16.5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
