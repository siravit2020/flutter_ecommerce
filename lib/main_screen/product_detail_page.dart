import 'dart:ui';
import 'package:flutter/widgets.dart';
import 'package:flutter_ecommerce/global_widgets/global_widgets.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce/color_plate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductDetail extends ConsumerWidget {
  const ProductDetail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final w = MediaQuery.of(context).size.width;
    final w5 = MediaQuery.of(context).size.width / 5;
    final height = MediaQuery.of(context).size.height - kToolbarHeight;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          splashRadius: 20,
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/icons/backArrow.svg',
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        title: Text(
          "PRODUCT DETAILS",
          style: TextStyle(
            fontSize: 13,
            fontFamily: 'avenirB',
            color: Colors.black,
            letterSpacing: 1.5,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image(
                image: AssetImage('assets/image/Gulcehre_ibrik.png'),
                width: w5 * 4,
              ),
              Container(
                width: double.infinity,
                constraints: new BoxConstraints(
            minHeight: height/2,
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
                    SizedBox(
                      height: 44,
                    ),
                    Text(
                      "Hagia Sophia \n Deesis Mosaic Vase",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontFamily: 'avenirH'),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/star.svg',
                          color: brownGoldColor,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        SvgPicture.asset(
                          'assets/icons/star.svg',
                          color: brownGoldColor,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        SvgPicture.asset(
                          'assets/icons/star.svg',
                          color: brownGoldColor,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        SvgPicture.asset(
                          'assets/icons/star.svg',
                          color: brownGoldColor,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        SvgPicture.asset(
                          'assets/icons/star.svg',
                          color: brownGoldColor.withOpacity(0.3),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "1.248 Reviews",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'avenirB',
                              fontSize: 12),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 27,
                    ),
                    Text(
                      "The Virgin Mary in the “Deesis” scene in the south\ngallery of Hagia Sophia is depicted on the Hagia\nSophia Mosaic Vase.",
                      textAlign: TextAlign.center,
                      style: TextStyle(

                          color: Colors.black,
                          fontFamily: 'avenirB',
                          fontSize: 12),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
