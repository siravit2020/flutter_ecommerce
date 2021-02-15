import 'dart:convert';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter_ecommerce/color_plate.dart';
import 'package:flutter_ecommerce/global_widgets/global_widgets.dart';
import 'package:flutter_ecommerce/loading_screen/loading_page.dart';
import 'package:flutter_ecommerce/login_and_register/google_facebook_login.dart';
import 'package:flutter_ecommerce/text_style.dart';


import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:email_validator/email_validator.dart';


_remember(String email, String password, bool remember) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('remember', remember);
  await prefs.setString('email', email);
  await prefs.setString('password', password);
}

class LoginPage extends StatefulWidget {
  final PageController pageController;

  const LoginPage(@required this.pageController, {Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  bool passwordStatus = true;
  bool remember = false;
  bool passwordColor = false;

  void start() async {
    SharedPreferences.getInstance().then((prefs) {
      print("ss");
      if (prefs.getBool('remember') != null) {
        if (prefs.getBool('remember')) {
          print(prefs.getBool('remember'));
          remember = true;
          emailController.text = prefs.getString('email') ?? '';
          passwordController.text = prefs.getString('password') ?? '';
          setState(() {});
        }
      }
    });
  }

  
  void initState() {
    super.initState();

    start();
  }

  @override
  void dispose() {
    if (!remember) {
      SharedPreferences.getInstance().then((prefs) {
        prefs.setBool('remember', false);
        prefs.setString('email', emailController.text);
        prefs.setString('password', passwordController.text);
      });
    }
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final w = 1.sw;
    final w5 = w / 5;

    return Builder(
      builder: (ctx) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: 38.5.h,
          ),
          Text(
            "Let’s sign you in",
            style: TextStyle(
                color: Colors.black, fontSize: 30.sp, fontFamily: 'avenirH'),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 8.h,
          ),
          Text("Welcome back, you’ve been missed!",
              style: b14, textAlign: TextAlign.center),
          SizedBox(
            height: 49.5.h,
          ),
          infomation(w, context),
          SizedBox(
            height: 40.h,
          ),
          ButtonFill(
            width: w5 * 3,
            color: (passwordColor)
                ? brownGoldColor.withOpacity(0.5)
                : brownGoldColor,
            fuction: () {
              if (_formKey.currentState.validate()) {
                showGeneralDialog(
                  context: context,
                  barrierDismissible: false,
                  transitionDuration: const Duration(milliseconds: 400),
                  pageBuilder: (_, __, ___) {
                    return LoadingPage(
                      nextPage: "null",
                    );
                  },
                );
                sigin(context, ctx);
              }
            },
            message: "SIGN IN",
          ),
          Spacer(),
        
          GoogleAndFacebook(type: true),
          SizedBox(
            height: 10.h,
          ),
          GoogleAndFacebook(type: false),
          SizedBox(
            height: 28.h,
          ),
          const TextBottom(
            text: 'Already have an account? ',
            text2: 'Sign In',
            target: '/login',
          ),
          SizedBox(
            height: 16.5.h,
          ),
        ],
      ),
    );
  }

  Future sigin(BuildContext context, BuildContext ctx) async {
    if (!passwordColor) {
      FocusScope.of(context).unfocus();
      if (remember) {
        print("mem");
        _remember(emailController.text, passwordController.text, remember);
      }

      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);
        Navigator.pop(context);
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/main', (Route<dynamic> route) => false);
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);
        if (e.code == 'user-not-found') {
          final snackBar =
              SnackBar(content: Text('No user found for that email.'));
          ScaffoldMessenger.of(ctx).showSnackBar(snackBar);
        } else if (e.code == 'wrong-password') {
          final snackBar =
              SnackBar(content: Text('Wrong password provided for that user.'));
          ScaffoldMessenger.of(ctx).showSnackBar(snackBar);
        }
      }
    }
  }

  Form infomation(double w, BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.08),
            child: TextFormField(
              validator: (value) => EmailValidator.validate(value)
                  ? null
                  : "Please enter a valid email",
              style: b16,
              controller: emailController,
              cursorColor: const Color(0xffAA7E6F),
              decoration: InputDecoration(
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffE5E5E5)),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFCC9D76)),
                ),
                contentPadding: EdgeInsets.only(left: 10.w),
                labelText: 'Email',
              ),
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.08),
            child: Stack(
              alignment: const Alignment(1, 1),
              children: [
                TextFormField(
                    validator: (value) {
                      if (value.length < 8) {
                        return 'Please enter at least 8 characters.';
                      }
                      return null;
                    },
                    controller: passwordController,
                    cursorColor: (passwordColor) ? Colors.red : brownGoldColor,
                    style: (passwordColor)
                        ? TextStyle(
                            color: Colors.red,
                            fontFamily: 'avenirB',
                            fontSize: 16.sp,
                          )
                        : TextStyle(
                            fontFamily: 'avenirB',
                            fontSize: 16.sp,
                          ),
                    obscureText: passwordStatus,
                    decoration: InputDecoration(
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffE5E5E5)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color:
                                (passwordColor) ? Colors.red : brownGoldColor),
                      ),
                      contentPadding: EdgeInsets.only(left: 10.w, right: 50.w),
                      labelText: 'Password',
                    ),
                    onChanged: (String newVal) {
                      if (newVal.length > 20)
                        passwordColor = true;
                      else
                        passwordColor = false;

                      setState(() {});
                    }),
                IconButton(
                  onPressed: () {
                    passwordStatus = !passwordStatus;
                    setState(() {});
                  },
                  icon: Icon((passwordStatus)
                      ? Icons.visibility
                      : Icons.visibility_off),
                  color: (passwordStatus)
                      ? Colors.black.withOpacity(0.2)
                      : const Color(0xffCC9D76),
                  iconSize: 16,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Theme(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 24.h,
                        width: 24.w,
                        child: Checkbox(
                          activeColor: brownGoldColor,
                          onChanged: (bool newValue) {
                            remember = newValue;
                            setState(() {});
                          },
                          value: remember,
                          focusColor: Colors.red,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        "Remember me",
                        style: b14,
                      ),
                    ],
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: brownGoldColor.withOpacity(0.3),
                      highlightColor: brownGoldColor.withOpacity(0.2),
                      onTap: () {
                        widget.pageController.nextPage(
                            curve: Curves.easeInOutQuint,
                            duration: Duration(milliseconds: 400));
                      },
                      child: Text(
                        "Forgot password?",
                        style: b14,
                      ),
                    ),
                  )
                ],
              ),
            ),
            data: ThemeData(
              primarySwatch: Colors.blue,
              unselectedWidgetColor:
                  Color(0xffA5A6AE).withOpacity(0.5), // Your color
            ),
          ),
        ],
      ),
    );
  }
}
