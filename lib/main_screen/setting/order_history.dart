import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce/color_plate.dart';
import 'package:flutter_ecommerce/global_widgets/global_widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderHistory extends ConsumerWidget {
  const OrderHistory({Key key}) : super(key: key);

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
              "ORDER HISTORY",
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
                    detailsOrder(21412,"23th of January", "230.99", "Delivered"),
                    Divider(
                      thickness: 1,
                      height: 62,
                    ),
                    detailsOrder(21403,"31st of December", "99.00", "Delivered"),
                    Divider(
                      thickness: 1,
                      height: 62,
                    ),
                    detailsOrder(21358,"14th of November", "599.00", "Delivered"),
                    Divider(
                      thickness: 1,
                      height: 62,
                    ),
                    detailsOrder(21313,"2nd ot December", "599.00", "Delivered"),
                    Divider(
                      thickness: 1,
                      height: 62,
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }

  Column detailsOrder(int order,String placedOn, String amount, String status) {
    return Column(
      children: [
   
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "ORDER #$order",
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'avenirB',
                color: textGrey,
              ),
            ),
            Text(
              "View Details",
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
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Placed On:",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'avenirB',
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 11,
                ),
                Text(
                  "Amount:",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'avenirB',
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 11,
                ),
                Text(
                  "Status:",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'avenirB',
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 9,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  placedOn,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'avenirB',
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 11,
                ),
                Text(
                  "\$$amount",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'avenirB',
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 11,
                ),
                Text(
                  status,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'avenirB',
                    color: Colors.black,
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
