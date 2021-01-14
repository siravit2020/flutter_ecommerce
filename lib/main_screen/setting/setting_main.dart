import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../color_plate.dart';

class SettingMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final w5 = MediaQuery.of(context).size.width / 5;
    final height = MediaQuery.of(context).size.height;
    return Container(
      constraints: new BoxConstraints(
        minHeight: height - pTop - pBottom,
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
          SizedBox(height: 16.5),
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
          SizedBox(height: 22.5),
          Text(
            "Ugur Ates",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontFamily: 'avenirH'),
          ),
          SizedBox(height: 1),
          Text(
            "ugurates19@gmail.com",
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontFamily: 'avenirB'),
          ),
          SizedBox(height: 2),
          newMethod(w, "Order History"),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.08),
            child: Divider(
              thickness: 1,
              height: 0,
            ),
          ),
          newMethod(w, "My Addresses"),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.08),
            child: Divider(
              thickness: 1,
              height: 0,
            ),
          ),
          newMethod(w, "My Cards"),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.08),
            child: Divider(
              thickness: 1,
              height: 0,
            ),
          ),
          newMethod(w, "Vouches"),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.08),
            child: Divider(
              thickness: 1,
              height: 0,
            ),
          ),
          newMethod(w, "Nearby Stores"),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.08),
            child: Divider(
              thickness: 1,
              height: 0,
            ),
          ),
          newMethod(w, "Latest Articles"),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.08),
            child: Divider(
              thickness: 1,
              height: 0,
            ),
          ),
          newMethod(w, "Setting"),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.08),
            child: Divider(
              thickness: 1,
              height: 0,
            ),
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }

  GestureDetector newMethod(double w, String title) {
    return GestureDetector(
      onTap: () {
        print(title);
      },
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(
              top: 30, bottom: 16, right: w * 0.08 + 10, left: w * 0.08 + 10),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'avenirB'),
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
