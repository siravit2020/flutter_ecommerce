import 'package:flutter/material.dart';

import 'package:flutter_ecommerce/global_widgets/global_widgets.dart';
import 'package:flutter_ecommerce/login_and_register/login_screen/login_page.dart';
import 'package:flutter_ecommerce/login_and_register/login_screen/reset_password_page.dart';


import 'package:flutter_ecommerce/main.dart';

import 'package:flutter_ecommerce/text_style.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  PageController pageController = PageController(initialPage: 0);

  bool expand = false;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      print(pageController.page);
      if (pageController.page == 0) {
        expand = false;
        setState(() {});
      } else if (pageController.page == 1) {
        expand = true;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          print(pageController.page);
          if (pageController.page == 0)
            return true;
          else {
            pageController.animateToPage(
              0,
              curve: Curves.easeInOutQuint,
              duration: Duration(milliseconds: 400),
            );
            return false;
          }
        },
        child: Scaffold(
          resizeToAvoidBottomPadding: expand,
          backgroundColor: Colors.black,
          appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
              splashRadius: 20,
              onPressed: () {
                if (pageController.page == 0)
                  Navigator.of(context).pop();
                else {
                  pageController.animateToPage(
                    0,
                    curve: Curves.easeInOutQuint,
                    duration: Duration(milliseconds: 400),
                  );
                }
              },
              icon: SvgPicture.asset(
                'assets/icons/backArrow.svg',
                color: Colors.white,
                width: 20.w,
              ),
            ),
            backgroundColor: Colors.black,
            title: Text(
              'LOGIN',
              style: b13.copyWith(
                color: Colors.white,
              ),
            ),
          ),
          body: Container(
            decoration: whiteCorner,
            child: PageView(
              physics: new NeverScrollableScrollPhysics(),
              controller: pageController,
              children: [
                LoginPage(pageController),
                ResetPassword(pageController),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
