import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_ecommerce/color_plate.dart';
import 'package:flutter_ecommerce/global_widgets/global_widgets.dart';
import 'package:flutter_ecommerce/text_style.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderHistory extends ConsumerWidget {
  const OrderHistory({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final height = MediaQuery.of(context).size.height - kToolbarHeight;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          appBar: StandardAppbar(
            title: "ORDER HISTORY",
          ),
          body: Container(
            width: double.infinity,
            constraints: new BoxConstraints(
              minHeight: height,
            ),
            decoration: whiteCorner,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.sw * 0.08),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: 41.h,
                    ),
                    detailsOrder(
                        21412, "23th of January", "230.99", "Delivered"),
                    Divider(
                      thickness: 1,
                      height: 62.h,
                    ),
                    detailsOrder(
                        21403, "31st of December", "99.00", "Delivered"),
                    Divider(
                      thickness: 1,
                      height: 62.h,
                    ),
                    detailsOrder(
                        21358, "14th of November", "599.00", "Delivered"),
                    Divider(
                      thickness: 1,
                      height: 62.h,
                    ),
                    detailsOrder(
                        21313, "2nd ot December", "599.00", "Delivered"),
                    Divider(
                      thickness: 1,
                      height: 62.h,
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }

  Column detailsOrder(
      int order, String placedOn, String amount, String status) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "ORDER #$order",
              style: b14,
            ),
            Text(
              "View Details",
              style: b14.copyWith(color: brownGoldColor),
            ),
          ],
        ),
        SizedBox(
          height: 24.h,
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Placed On:",
                  style: b14.copyWith(color: Colors.black),
                ),
                SizedBox(
                  height: 11.h,
                ),
                Text(
                  "Amount:",
                  style: b14.copyWith(color: Colors.black),
                ),
                SizedBox(
                  height: 11.h,
                ),
                Text(
                  "Status:",
                  style: b14.copyWith(color: Colors.black),
                ),
              ],
            ),
            SizedBox(
              width: 9.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  placedOn,
                  style: b14.copyWith(color: Colors.black),
                ),
                SizedBox(
                  height: 11.h,
                ),
                Text(
                  "\$$amount",
                  style: b14.copyWith(color: Colors.black),
                ),
                SizedBox(
                  height: 11.h,
                ),
                Text(
                  status,
                  style: b14.copyWith(color: Colors.black),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
