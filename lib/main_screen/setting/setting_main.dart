import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constants.dart';
import 'package:flutter_ecommerce/text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../color_plate.dart';

class SettingMain extends StatelessWidget {
  final User user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: 20.h),
          Stack(
            children: [
              Container(
                width: 80.0,
                height: 80.0,
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                  image: user.photoURL != null
                      ? DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(user.photoURL),
                        )
                      : null,
                ),
                child: Center(
                  child: user.photoURL != null
                      ? null
                      : SvgPicture.asset(
                          'assets/icons/ua_ico.svg',
                          width: 34,
                          height: 34,
                          color: Colors.white,
                        ),
                ),
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
            user.displayName ?? "Ugur Ates",
            style: h20,
          ),
          SizedBox(height: 1),
          Text(
            user.email ?? "ugurates19@gmail.com",
            style: b14.copyWith(color: Colors.black),
          ),
          SizedBox(height: 2),
          item(context, w, "Order History", "orderhistory"),
          underLine(w),
          item(context, w, "My Addresses", "myaddress"),
          underLine(w),
          item(context, w, "My Cards", "mycard"),
          underLine(w),
          item(context, w, "Vouches", "myvouches"),
          underLine(w),
          item(context, w, "Nearby Stores", "map"),
          underLine(w),
          item(context, w, "Latest Articles", "latest"),
          underLine(w),
          item(context, w, "Setting", "setting"),
          underLine(w),
          SizedBox(
            height: 30.h,
          )
        ],
      ),
    );
  }

  Padding underLine(double w) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w * 0.08),
      child: Divider(
        thickness: 1,
        height: 0,
      ),
    );
  }

  GestureDetector item(
      BuildContext context, double w, String title, String page) {
    return GestureDetector(
      onTap: () {
        print(title);
        Navigator.pushNamed(context, '/$page');
      },
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(
              top: 30.h,
              bottom: 16.h,
              right: w * 0.08 + 10.w,
              left: w * 0.08 + 10.w),
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
                        width: 12.h,
                        height: 12.h,
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
