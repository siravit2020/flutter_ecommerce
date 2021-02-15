import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_ecommerce/color_plate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'page1.dart';
import 'page2.dart';
import 'page3.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroPage extends StatefulWidget {
  IntroPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _IntroPageState createState() => _IntroPageState();
}

final controller = PageController();

class _IntroPageState extends State<IntroPage> {
  @override
  void initState() {
    super.initState();
    check();
  }

  Future<bool> checkCurrentUser() async{
    if (FirebaseAuth.instance.currentUser != null)
      return true;
    else
      return false;
  }

  void check() async {
    bool current = await checkCurrentUser();
    if (current) {
      Navigator.pushNamedAndRemoveUntil(
          context, '/main', (Route<dynamic> route) => false);
    } else {
      // BotToast.showSimpleNotification(title: "init",);
      BotToast.showCustomNotification(
          animationDuration: Duration(milliseconds: 300),
          animationReverseDuration: Duration(milliseconds: 300),
          duration: Duration(seconds: 3),
          toastBuilder: (cancel) {
            return Padding(
              padding: EdgeInsets.only(top: 13.h, right: 27.5.w, left: 27.5.w),
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
                              left: 14.w, right: 14.w, top: 13.h, bottom: 13.h),
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
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.only(top: 18.h),
          child: Column(
            children: [
              SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  effect: ScaleEffect(
                    dotHeight: 4,
                    dotWidth: 4,
                    spacing: 10,
                    dotColor: Color(0xff707070),
                    activeDotColor: brownGoldColor,
                    activePaintStyle: PaintingStyle.fill,
                  ),
                  onDotClicked: (index) {}),
              Expanded(
                child: PageView(
                  controller: controller,
                  children: [
                    Page1(),
                    Page2(),
                    Page3(),
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
