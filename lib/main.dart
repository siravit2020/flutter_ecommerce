import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce/intro_screen/page1.dart';
import 'package:flutter_ecommerce/loading_screen/loading_page.dart';
import 'package:flutter_ecommerce/login_screen/login_page.dart';
import 'package:flutter_ecommerce/main_screen/main_page.dart';
import 'package:flutter_ecommerce/main_screen/setting/my_address.dart';
import 'package:flutter_ecommerce/main_screen/setting/new_address.dart';
import 'package:flutter_ecommerce/main_screen/setting/order_history.dart';
import 'package:flutter_ecommerce/main_screen/setting/setting_main.dart';

import 'package:flutter_ecommerce/more_detail.dart';
import 'package:flutter_ecommerce/reset_password_screen/reset_password_page.dart';
import 'package:flutter_ecommerce/search_screen/search_page.dart';
import 'package:flutter_ecommerce/send_email/send_eamil_page.dart';
import 'package:flutter_ecommerce/test13.dart';
import 'package:flutter_ecommerce/test14.dart';

import 'package:flutter_ecommerce/test3.dart';
import 'package:flutter_ecommerce/test4.dart';
import 'package:flutter_ecommerce/test5.dart';
import 'package:flutter_ecommerce/test7.dart';
import 'package:flutter_ecommerce/test9.dart';
import 'package:flutter_ecommerce/verification.dart/verification_page.dart';
import 'package:flutter_ecommerce/verification.dart/verified.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'intro_screen/intro_page.dart';
import 'intro_screen/page2.dart';
import 'intro_screen/page3.dart';

import 'main_screen/categories/product_detail_page.dart';
import 'register_screen/register_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'seach_and_hastag/hastag.dart';
import 'test2.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(375, 812),
        allowFontScaling: false,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',

          theme: ThemeData(
            primarySwatch: Colors.grey,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            inputDecorationTheme: InputDecorationTheme(
              labelStyle: TextStyle(
                decorationColor: Colors.red,
              ),
            ),
          ),
          initialRoute: //'/'
          //'/newaddress'
          '/detail'
          //'/setting'
          //'/test'
          //'/intro'
          ,
          routes: {
            '/': (context) => MainPageState(),
            '/hastag': (context) => HastagPage(),
            '/search': (context) => SearchPage(),
            '/intro': (context) => IntroPage(),
            '/verified': (context) => VerifiedPage(),
            '/detail': (context) => ProductDetail(),
            '/verification': (context) => VerificationPage(),
            '/register': (context) => RegisterPage(),
            '/forgot': (context) => ResetPassword(),
            '/login': (context) => LoginPage(),
            '/sendemail': (context) => SendEmail(),
            '/test': (context) => Test14(),
            '/setting': (context) => SettingMain(),
            '/orderhistory': (context) => OrderHistory(),
            '/myaddress': (context) => MyAddress(),
            '/newaddress': (context) => NewAddress()
            //Test13()
            ,
            //'/loading': (context) => LoadingPage(),
          },
          //home:
          //MainPage()
          //VerifiedPage()
          //VerificationPage()
          //SendEmail()
          //RipplesAnimation()
          //Test4()
          //ResetPassword()
          //Test3()
          //LoadingPage()
          //LoginPage()

          //RegisterPage()
          //IntroPage(),
        ));
  }

  SystemUiOverlayStyle statusBarLight() {
    return const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark);
  }

  SystemUiOverlayStyle statusBarDark() {
    return const SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light);
  }
}
