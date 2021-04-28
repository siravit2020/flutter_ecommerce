import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_ecommerce/color_plate.dart';
import 'package:flutter_ecommerce/global_widgets/global_widgets.dart';
import 'package:flutter_ecommerce/text_style.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../test5.dart';

class SendEmail extends ConsumerWidget {
  const SendEmail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
   
    final height = 1.sh - kToolbarHeight;

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
            right: 18.w,
            child: Padding(
              padding: EdgeInsets.only(top: 8.h),
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
                      icon: 'sendEmail.svg',
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Text(
                      "Check your email",
                      style: h30,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                        "We've sent you instructions on how to reset the \n password (also check the Spam folder)",
                        style: b14,
                        textAlign: TextAlign.center),
                  ],
                ),
              ),
              ButtonFill(
                width: (1.sw/5) * 3,
                message: "OPEN MY MAIL CLIENT",
                color: brownGoldColor,
                fuction: () {
                  Navigator.pushNamed(context, '/login');
                },
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
