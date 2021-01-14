import 'dart:math';
import 'dart:ui';
import 'package:flutter/widgets.dart';
import 'package:flutter_ecommerce/constants.dart';
import 'package:flutter_ecommerce/global_widgets/global_widgets.dart';
import 'package:flutter_ecommerce/main_screen/widgets/star.dart';
import 'package:flutter_ecommerce/more_detail.dart';
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
                  minHeight: height / 2,
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
                        StarRow(),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "1.248 Reviews",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'avenirB',
                              fontSize: 12),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 27,
                    ),
                    Text(
                      "The Virgin Mary in the “Deesis” scene in the south\ngallery of Hagia Sophia is depicted on the Hagia\nSophia Mosaic Vase.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: textGrey, fontFamily: 'avenirB', fontSize: 12),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "€3450",
                      style: TextStyle(
                          color: brownGoldColor,
                          fontFamily: 'avenirH',
                          fontSize: 30),
                    ),
                    SizedBox(
                      height: 26,
                    ),
                    MoreDetails(),
                    // Text(
                    //   "Similar products",
                    //   style: TextStyle(
                    //       color: Colors.black,
                    //       fontFamily: 'avenirH',
                    //       fontSize: 24),
                    // ),
                    // SizedBox(height: 27,),
                    // rowItem(featuredName2,featuredPrice2,featuredImage2),
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
SizedBox rowItem(
      List<String> listName, List<String> listPrice, List<String> listIamge) {
    return SizedBox(
      height: 230,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listName.length,
        itemBuilder: (context, index) {
          var ran = Random().nextInt(2);
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child: Stack(
                  children: [
                    Image(
                      image: AssetImage('assets/image/${listIamge[index]}'),
                      width: 150,
                    ),
                    if (ran == 0)
                      Positioned(
                        right: 0,
                        top: 10,
                        child: Container(
                          decoration: new BoxDecoration(
                              color: brownGoldColor,
                              borderRadius: new BorderRadius.only(
                                bottomLeft: const Radius.circular(4),
                                topRight: const Radius.circular(4),
                              )),
                          padding: EdgeInsets.all(4),
                          child: Text(
                            "-${Random().nextInt(50) + 20}%",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'avenirB'),
                          ),
                        ),
                      ),
          
                  ],
                ),
              ),
              SizedBox(
                height: 10.5,
              ),
              Text(
                listName[index],
                style: TextStyle(
                    color: Colors.black, fontSize: 14, fontFamily: 'avenirB'),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                listPrice[index],
                style: TextStyle(
                    color: Colors.black, fontSize: 24, fontFamily: 'avenirM'),
                textAlign: TextAlign.center,
              ),
            ],
          );
        },
      ),
    );
  }