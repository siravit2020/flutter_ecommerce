import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce/intro_screen/page1.dart';
import 'package:flutter_ecommerce/loading_screen/loading_page.dart';
import 'package:flutter_ecommerce/login_and_register/login_screen/screen.dart';
import 'package:flutter_ecommerce/login_and_register/register_screen/register_page.dart';
import 'package:flutter_ecommerce/login_and_register/verification.dart/verification_page.dart';

import 'package:flutter_ecommerce/main_screen/main_page.dart';
import 'package:flutter_ecommerce/main_screen/setting/google_map.dart';
import 'package:flutter_ecommerce/main_screen/setting/latest_articles.dart';
import 'package:flutter_ecommerce/main_screen/setting/my_address.dart';
import 'package:flutter_ecommerce/main_screen/setting/my_card.dart';
import 'package:flutter_ecommerce/main_screen/setting/my_location.dart';
import 'package:flutter_ecommerce/main_screen/setting/my_vouches.dart';
import 'package:flutter_ecommerce/main_screen/setting/new_address.dart';
import 'package:flutter_ecommerce/main_screen/setting/order_history.dart';
import 'package:flutter_ecommerce/main_screen/setting/setting.dart';
import 'package:flutter_ecommerce/main_screen/setting/setting_main.dart';

import 'package:flutter_ecommerce/more_detail.dart';
import 'package:flutter_ecommerce/order_detail.dart';
import 'package:flutter_ecommerce/order_status.dart';
import 'package:flutter_ecommerce/order_success.dart';
import 'package:flutter_ecommerce/payment_detail.dart';

import 'package:flutter_ecommerce/select_country.dart';

import 'package:flutter_ecommerce/send_email/send_eamil_page.dart';
import 'package:flutter_ecommerce/shipping_info.dart';
import 'package:flutter_ecommerce/test6.dart';
import 'package:flutter_ecommerce/test_dynamic.dart';

import 'package:flutter_ecommerce/test_map/map_test.dart';

import 'package:flutter_riverpod/all.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'intro_screen/intro_page.dart';
import 'intro_screen/page2.dart';
import 'intro_screen/page3.dart';

import 'main_screen/categories/product_detail_page.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'seach_and_hastag/hastag.dart';
import 'seach_and_hastag/search_page.dart';
import 'package:bot_toast/bot_toast.dart';
void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
   WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: App()));
}
class App extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return SizedBox();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MyApp();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Container(color: Colors.black,);
      },
    );
  }
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
          builder: BotToastInit(), 
          navigatorObservers: [BotToastNavigatorObserver()],
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
              // '/orderstatus'
              //'/detail'
              //'/setting'
              //'/test'
              //'/intro'
              //'/map'
              '/intro',
          routes: {
            '/main': (context) => MainPageState(),
            '/hastag': (context) => HastagPage(),
            '/search': (context) => SearchPage(),
            '/intro': (context) => IntroPage(),
        
            '/detail': (context) => ProductDetail(),
            '/test2': (context) => LoginScreen(),
          
            '/register': (context) => RegisterPage(),
            
             '/login': (context) => LoginScreen(),
            '/sendemail': (context) => SendEmail(),
             '/shipping': (context) => ShippingInfo(),
            '/settingmain': (context) => SettingMain(),
            '/orderhistory': (context) => OrderHistory(),
            '/ordersuccess': (context) => OrderSuccess(),
            '/myaddress': (context) => MyAddress(),
            '/newaddress': (context) => NewAddress(),
            '/mycard': (context) => MyCard(),
            '/myvouches': (context) => MyVouches(),
            '/latest': (context) => LatestArticles(),
            '/setting': (context) => Setting(),
            '/orderstatus': (context) => OrderStatus(),
            '/orderdetail': (context) => OrderDetail(),
            '/payment': (context) => PaymentDetail(),
            '/map': (context) => MapFull(),
            '/mylocation': (context) => MyLocation(),
            '/test': (context) => TestDynamic(),
       
            '/testload': (context) => LoadingPage(
                  nextPage: "null",
                )

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
