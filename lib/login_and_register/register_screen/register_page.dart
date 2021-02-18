import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce/color_plate.dart';
import 'package:flutter_ecommerce/constants.dart';
import 'package:flutter_ecommerce/global_widgets/global_widgets.dart';
import 'package:flutter_ecommerce/loading_screen/loading_page.dart';
import 'package:flutter_ecommerce/login_and_register/google_facebook_login.dart';
import 'package:flutter_ecommerce/login_and_register/riverpod.dart';
import 'package:flutter_ecommerce/login_and_register/verification.dart/verification_page.dart';

import 'package:flutter_ecommerce/text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:firebase_auth/firebase_auth.dart';

var maskFormatter = new MaskTextInputFormatter(
    mask: '+66 ### ### ####', filter: {"#": RegExp(r'[0-9]')});

void showSnack(BuildContext ctx, String title) {
  final snackBar = SnackBar(content: Text(title));
  Scaffold.of(ctx).showSnackBar(snackBar);
}

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final w = 1.sw;
    final w5 = w / 5;
    final height = 1.sh - kToolbarHeight;
    final _formKey = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          appBar: StandardAppbar(
            title: "REGISTER",
          ),
          body: Container(
            constraints: new BoxConstraints(
              minHeight: height,
            ),
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(20.0),
                topRight: const Radius.circular(20.0),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 38.5.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.08),
                    child: Text(
                      "Create your account",
                      style: h30,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.08),
                    child: Text(
                        "After your registration is complete \n you can see our opportunity products.",
                        style: b14,
                        textAlign: TextAlign.center),
                  ),
                  SizedBox(
                    height: 29.5.h,
                  ),
                  infomation(_formKey, w),
                  SizedBox(
                    height: 40.h,
                  ), //final controller = watch(controllerChange);
                  Consumer(builder: (context, watch, child) {
                    final textField = watch(testControllerChange);
                    final passwordColor = watch(passwordColorState);
                    return ButtonFill(
                      message: "SIGN UP",
                      color: (passwordColor.state)
                          ? brownGoldColor.withOpacity(0.5)
                          : brownGoldColor,
                      fuction: () {
                        if (_formKey.currentState.validate()) {
                          showGeneralDialog(
                            context: context,
                            barrierDismissible: false,
                            transitionDuration:
                                const Duration(milliseconds: 400),
                            pageBuilder: (_, __, ___) {
                              // your widget implementation
                              return LoadingPage(
                                nextPage: "null",
                              );
                            },
                          );
                          register(context, passwordColor, textField);
                        }
                      },
                      width: w5 * 3,
                    );
                  }),

                  SizedBox(
                    height: 36.h,
                  ),
                  GoogleAndFacebook(type: true),
                  SizedBox(
                    height: 10.h,
                  ),
                  GoogleAndFacebook(type: false),
                  SizedBox(
                    height: 28.h,
                  ),
                  TextBottom(
                    text: 'Already have an account? ',
                    text2: 'Sign In',
                    target: '/login',
                  ),
                  SizedBox(
                    height: 16.5.h,
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Form infomation(GlobalKey<FormState> _formKey, double w) {
    return Form(
      key: _formKey,
      child: Consumer(builder: (context, watch, child) {
        final visible = watch(visiblePassword);
        final textField = watch(testControllerChange);
        final passwordColor = watch(passwordColorState);
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.sw * 0.08),
              child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onChanged: (String text) {
                    textField.username = text;
                  },
                  style: TextStyle(fontFamily: 'avenirB', fontSize: 16.sp),
                  cursorColor: const Color(0xffAA7E6F),
                  decoration: decoration.copyWith(
                    labelText: "Username",
                  )),
            ),
            SizedBox(
              height: 25.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.sw * 0.08),
              child: TextFormField(
                  validator: (value) => EmailValidator.validate(value)
                      ? null
                      : "Please enter a valid email",
                  onChanged: (String text) {
                    textField.email = text;
                  },
                  style: TextStyle(fontFamily: 'avenirB', fontSize: 16.sp),
                  cursorColor: const Color(0xffAA7E6F),
                  decoration: decoration.copyWith(
                    labelText: "Email",
                  )),
            ),
            SizedBox(
              height: 25.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.08),
              child: Stack(
                alignment: const Alignment(1.0, 1.0),
                children: [
                  TextFormField(
                      validator: (value) {
                        if (value.length < 8) {
                          return 'Please enter at least 8 characters.';
                        }
                        return null;
                      },
                      style: (passwordColor.state)
                          ? TextStyle(
                              color: Colors.red,
                              fontFamily: 'avenirB',
                              fontSize: 16.sp,
                            )
                          : TextStyle(
                              fontFamily: 'avenirB',
                              fontSize: 16.sp,
                            ),
                      cursorColor: const Color(0xffAA7E6F),
                      obscureText: visible.password,
                      decoration: InputDecoration(
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffE5E5E5)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: (passwordColor.state)
                                ? Colors.red
                                : brownGoldColor,
                          ),
                        ),
                        contentPadding:
                            EdgeInsets.only(left: 10.w, right: 50.w),
                        labelText: 'Password',
                      ),
                      onChanged: (String text) {
                        if (text.length > 20)
                          passwordColor.state = true;
                        else
                          passwordColor.state = false;

                        textField.pass = text;
                      }),
                  Container(
                    child: IconButton(
                      onPressed: () {
                        visible.change();
                      },
                      icon: Icon((visible.password)
                          ? Icons.visibility
                          : Icons.visibility_off),
                      color: (visible.password)
                          ? Colors.black.withOpacity(0.2)
                          : const Color(0xffCC9D76),
                      iconSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.08),
              child: TextFormField(
                  validator: (value) {
                    if (value.length != 16) {
                      return 'Please enter a valid phone number.';
                    }
                    return null;
                  },
                  onChanged: (String text) {
                    textField.phone = text;
                    print(text.length);
                  },
                  style: b16,
                  inputFormatters: [maskFormatter],
                  keyboardType: TextInputType.number,
                  cursorColor: Color(0xffAA7E6F),
                  decoration: decoration.copyWith(
                    labelText: 'Phone',
                  )),
            ),
          ],
        );
      }),
    );
  }

  Future register(BuildContext context, StateController<bool> passwordColor,
      TestControllerChange textField) async {
        FocusScope.of(context).unfocus();
    if (!passwordColor.state)
      //Navigator.pushNamed(context, '/loading');
      try {
        
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: textField.email, password: textField.pass);

        CollectionReference users =
            FirebaseFirestore.instance.collection('Users');

        userCredential.user.updateProfile(
          displayName: textField.username,
        );
        users.doc(userCredential.user.uid).set({
          'Username': textField.username,
          'Phone': textField.phone
        }).then((value) {
          Navigator.pop(context);
          
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => VerificationPage(textField.phone)),
          );
        }).catchError((error) => print("Failed to add user: $error"));
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);
        if (e.code == 'weak-password') {
         
          showSnack(context, 'The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          showSnack(context, 'The account already exists for that email.');
          
        }
      } catch (e) {
        print(e);
      }
  }
}
