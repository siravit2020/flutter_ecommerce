import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce/color_plate.dart';
import 'package:flutter_ecommerce/global_widgets/global_widgets.dart';
import 'package:flutter_ecommerce/text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class LatestArticles extends ConsumerWidget {
  const LatestArticles({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final w = MediaQuery.of(context).size.width;
    final w5 = MediaQuery.of(context).size.width / 5;
    final height = MediaQuery.of(context).size.height - kToolbarHeight;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          appBar: StandardAppbar(title: "LATEST ARTICLES",),
          body: Container(
            width: double.infinity,
            constraints: new BoxConstraints(
              minHeight: height,
            ),
            decoration: whiteCorner,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: w * 0.08),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: 41.h,
                    ),
                    item("“Soteria” Vase buy in the next year", "SoteriaVase.png"),
                    SizedBox(
                      height: 21.h,
                    ),
                     item("“Devr-i Alem” Flask buy in the next year", "KavukVase.png"),
                    SizedBox(
                      height: 60,
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }

  Column item(String title, String image) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 200.h,
              width: double.infinity,
              decoration: new BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Image(
                image: AssetImage('assets/image/$image'),
              ),
            ),
            Positioned(
              bottom: 15.5.h,
              right: 10.5.w,
              child: SvgPicture.asset(
                'assets/icons/Icons-icon-added-to-fav.svg',
                width: 30,
                height: 30,
              ),
            )
          ],
        ),
        SizedBox(
          height: 31.h,
        ),
        Text(
          title,
          style: h24,
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            SvgPicture.asset(
              'assets/icons/icon-clock.svg',
              width: 11,
              height: 11,
            ),
            SizedBox(
              width: 6.5.w,
            ),
            Text(
              "24th February 2020",
              style: b14.copyWith(color: Colors.black),
            ),
          ],
        ),
        SizedBox(
          height: 13.h,
        ),
        Text(
          "Flasks are vessels that utilised during military service or on journeys, carried hanging from the waist or the neck….",
          style: b14.copyWith(color: Colors.black),
        ),
        SizedBox(
          height: 21.h,
        ),
        GestureDetector(
          onTap: () {
            print("click");
          },
          child: Row(
            children: [
              Text(
                "Discover more",
                style: b14.copyWith(color: brownGoldColor),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                width: 4.3,
              ),
              SvgPicture.asset(
                'assets/icons/doubleArrows.svg',
                width: 5.67,
                color: brownGoldColor,
              )
            ],
          ),
        ),
      ],
    );
  }
}
