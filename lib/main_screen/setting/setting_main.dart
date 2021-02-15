import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constants.dart';
import 'package:flutter_ecommerce/text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../color_plate.dart';

class SettingMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: 16.5.h),
          Stack(
            children: [
              Container(
                width: 80.0,
                height: 80.0,
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: Center(
                    child: SvgPicture.asset(
                  'assets/icons/ua_ico.svg',
                  width: 34,
                  height: 34,
                  color: Colors.white,
                )),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: 30.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    color: brownGoldColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                      child: SvgPicture.asset(
                    'assets/icons/camera.svg',
                    width: 14,
                    height: 14,
                    color: Colors.white,
                  )),
                ),
              ),
            ],
          ),
          SizedBox(height: 22.5.h),
          Text(
            "Ugur Ates",
            style: h20,
          ),
          SizedBox(height: 1),
          Text(
            "ugurates19@gmail.com",
            style: b14.copyWith(color: Colors.black),
          ),
          SizedBox(height: 2),
          newMethod(context,w, "Order History","orderhistory"),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.08),
            child: Divider(
              thickness: 1,
              height: 0,
            ),
          ),
          newMethod(context,w, "My Addresses","myaddress"),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.08),
            child: Divider(
              thickness: 1,
              height: 0,
            ),
          ),
          newMethod(context,w, "My Cards","mycard"),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.08),
            child: Divider(
              thickness: 1,
              height: 0,
            ),
          ),
          newMethod(context,w, "Vouches","myvouches"),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.08),
            child: Divider(
              thickness: 1,
              height: 0,
            ),
          ),
          newMethod(context,w, "Nearby Stores","map"),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.08),
            child: Divider(
              thickness: 1,
              height: 0,
            ),
          ),
          newMethod(context,w, "Latest Articles","latest"),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.08),
            child: Divider(
              thickness: 1,
              height: 0,
            ),
          ),
          newMethod(context,w, "Setting","setting"),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.08),
            child: Divider(
              thickness: 1,
              height: 0,
            ),
          ),
          SizedBox(
            height: 30.h,
          )
        ],
      ),
    );
  }

  GestureDetector newMethod(BuildContext context,double w, String title,String page) {
    return GestureDetector(
      onTap: () {
        print(title);
        Navigator.pushNamed(context, '/$page');
      },
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(
              top: 30.h, bottom: 16.h, right: w * 0.08 + 10.w, left: w * 0.08 + 10.w),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: b16,
                      ),
                     
                      SvgPicture.asset(
                        'assets/icons/arrow_right.svg',
                        width: 12,
                        height: 12,
                        color: Colors.black,
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
