import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce/color_plate.dart';
import 'package:flutter_ecommerce/global_widgets/global_widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
              "LATEST ARTICLES",
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
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: w * 0.08),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    item("“Soteria” Vase buy in the next year", "SoteriaVase.png"),
                    SizedBox(
                      height: 21,
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
              height: 200,
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
              bottom: 15.5,
              right: 10.5,
              child: SvgPicture.asset(
                'assets/icons/Icons-icon-added-to-fav.svg',
                width: 30,
                height: 30,
              ),
            )
          ],
        ),
        SizedBox(
          height: 31,
        ),
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontFamily: 'avenirH',
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            SvgPicture.asset(
              'assets/icons/icon-clock.svg',
              width: 11,
              height: 11,
            ),
            SizedBox(
              width: 6.5,
            ),
            Text(
              "24th February 2020",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'avenirB',
              ),
            ),
          ],
        ),
        SizedBox(
          height: 13,
        ),
        Text(
          "Flasks are vessels that utilised during military service or on journeys, carried hanging from the waist or the neck….",
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: 'avenirB',
          ),
        ),
        SizedBox(
          height: 21,
        ),
        GestureDetector(
          onTap: () {
            print("click");
          },
          child: Row(
            children: [
              Text(
                "Discover more",
                style: TextStyle(
                    color: brownGoldColor, fontSize: 14, fontFamily: 'avenirB'),
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
