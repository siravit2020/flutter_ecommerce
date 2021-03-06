
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_ecommerce/color_plate.dart';
import 'package:flutter_ecommerce/services/notifications_service.dart';

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

  Future<bool> checkCurrentUser() async {
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
      NotificationService().show;
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
