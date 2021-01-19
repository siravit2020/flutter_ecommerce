import 'dart:ui';
import 'package:flutter_ecommerce/global_widgets/global_widgets.dart';
import 'package:flutter_ecommerce/text_style.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce/color_plate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPassword extends ConsumerWidget {
  const ResetPassword({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
   
    final height = MediaQuery.of(context).size.height - kToolbarHeight;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: StandardAppbar(title: "LOG IN",),
        body: Container(
          constraints: BoxConstraints(
            minHeight: height,
          ),
          decoration: whiteCorner,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      height: 44.h,
                    ),
                    Text(
                      "Forgot your password?",
                      style: h30,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                        "Enter your email address and we will send you \n instructions on how to reset your password.",
                        style: b14,
                        textAlign: TextAlign.center),
                    SizedBox(
                      height: 49.5.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 1.sw * 0.08),
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
           
                  ],
                ),
              ),
              ButtonFill(
                fuction: () {
                  Navigator.pushNamed(context, '/sendemail');
                },
                color: brownGoldColor,
                message: "RECOVER EMAIL",
                width: (1.sw/5) * 3,
              ),
              SizedBox(
                height: 16.5.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
