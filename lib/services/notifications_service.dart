import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/color_plate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationService {
  get show => BotToast.showCustomNotification(
      animationDuration: Duration(milliseconds: 300),
      animationReverseDuration: Duration(milliseconds: 300),
      duration: Duration(seconds: 3),
      toastBuilder: (cancel) {
        return Padding(
          padding: EdgeInsets.only(
            top: 13.h,
            right: 27.5.w,
            left: 27.5.w,
          ),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                      color: brownGoldColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 14.w,
                        right: 14.w,
                        top: 13.h,
                        bottom: 13.h,
                      ),
                      child: SvgPicture.asset(
                          'assets/icons/icon-notification.svg',
                          height: 22.h),
                    ),
                  ),
                  SizedBox(
                    width: 13.w,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Please update your payment'),
                      SizedBox(
                        height: 6.h,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/icon-clock.svg',
                            height: 10.h,
                            color: Colors.black.withOpacity(0.5),
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text('Just now'),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
      enableSlideOff: true,
      onlyOne: true,
      crossPage: true);
}
