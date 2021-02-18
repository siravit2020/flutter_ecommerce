import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/color_plate.dart';
import 'package:flutter_ecommerce/loading_screen/loading_page.dart';
import 'package:flutter_ecommerce/login_and_register/google_facebook_login.dart';
import 'package:flutter_ecommerce/text_style.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final smsColorState = StateProvider<bool>((ref) {
  return false;
});
final smsButtonState = StateProvider<bool>((ref) {
  return false;
});
final smsRiverpod = ChangeNotifierProvider<SmsRiverpod>((ref) {
  return SmsRiverpod();
});

class SmsRiverpod extends ChangeNotifier {
  Timer timer;
  int start = 10;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        print(start);
        if (start == 0) {
          start = 10;
          timer.cancel();
        } else {
          start--;
        }
        notifyListeners();
      },
    );
  }
}

String id;
void phone(String phoneNumber) async {
  await FirebaseAuth.instance.verifyPhoneNumber(
    phoneNumber: phoneNumber,
    verificationCompleted: (PhoneAuthCredential credential) {
      print('Phone complete ${credential.smsCode}');
    },
    verificationFailed: (FirebaseAuthException e) {
      print('Phone Failed');
    },
    codeSent: (String verificationId, int resendToken) {
      print('Phone Send $resendToken $verificationId');
      id = verificationId;
    },
    codeAutoRetrievalTimeout: (String verificationId) {
      print('Phone Timeout');
    },
  );
}

void check(String smsCode, String id) async {
  PhoneAuthCredential phoneAuthCredential =
      PhoneAuthProvider.credential(verificationId: id, smsCode: smsCode);
  auth.currentUser.updatePhoneNumber(phoneAuthCredential).then((value) {
    print('OK');
  }).catchError((e) {
    print('Error');
  });
}

class VerificationPage extends StatelessWidget {
  const VerificationPage(this.phoneNumber, {Key key}) : super(key: key);
  final String phoneNumber;
  @override
  Widget build(BuildContext context) {
    String sms = '';

    final w5 = MediaQuery.of(context).size.width / 5;
    final height = MediaQuery.of(context).size.height - kToolbarHeight;

    phone(phoneNumber);
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
              top: kToolbarHeight,
              right: 18.w,
              child: Padding(
                padding: EdgeInsets.only(top: 8.h),
                child: SvgPicture.asset('assets/icons/close.svg'),
              ),
            ),
            Consumer(builder: (context, watch, child) {
              final river = watch(smsRiverpod);
              final buttonSms = watch(smsButtonState);
              return Container(
                width: double.infinity,
                constraints: new BoxConstraints(
                  minHeight: height,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 1.sw * 0.08),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //1 222 555 6677

                            Text(
                              "Enter the 6 digit code sent to:",
                              style: h24,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              phoneNumber,
                              style: h30.copyWith(color: brownGoldColor),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 10.5.h,
                            ),

                            Text(
                                "We've sent a 6 digit code to your phone number. Please enter the verification code.",
                                style: b14,
                                textAlign: TextAlign.center),

                            SizedBox(
                              height: 84.5.h,
                            ),

                            PinCodeTextField(
                              appContext: context,
                              length: 6,
                              obscureText: false,
                              animationType: AnimationType.fade,
                              textStyle: h24,
                              pinTheme: PinTheme(
                                shape: PinCodeFieldShape.underline,
                                borderWidth: 1,
                                fieldHeight: 42.h,
                                fieldWidth: 40.w,
                                activeFillColor: Colors.transparent,
                                activeColor: Colors.black.withOpacity(0.1),
                                inactiveFillColor: Colors.transparent,
                                inactiveColor: Colors.black.withOpacity(0.1),
                                selectedFillColor: Colors.transparent,
                                selectedColor: brownGoldColor,
                              ),
                              animationDuration: Duration(milliseconds: 300),
                              enableActiveFill: true,
                              onCompleted: (v) {
                                print("Completed $v");
                                sms = v;
                                check(sms, id);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoadingPage(
                                      nextPage: '/verified',
                                    ),
                                  ),
                                );
                              },
                              onChanged: (value) {
                                if (value.length == 6)
                                  buttonSms.state = true;
                                else
                                  buttonSms.state = false;
                                print(value);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text("Didn’t receive the SMS?",
                        style: TextStyle(
                          color: (river.start == 10)
                              ? Color(0xff676870)
                              : Colors.black,
                          fontSize: 14.sp,
                          fontFamily: 'avenirB',
                        ),
                        textAlign: TextAlign.center),
                    Text(
                        (river.start == 10)
                            ? "Request new code in 00:00"
                            : (river.start < 9)
                                ? "Request new code in 00:0${river.start}"
                                : "Request new code in 00:${river.start}",
                        style: TextStyle(
                          color: (river.start == 10)
                              ? Colors.black
                              : brownGoldColor,
                          fontSize: 14.sp,
                          fontFamily: 'avenirB',
                        ),
                        textAlign: TextAlign.center),
                    SizedBox(
                      height: 30.h,
                    ),
                    FlatButton(
                      minWidth: w5 * 3,
                      padding: EdgeInsets.fromLTRB(20, 12, 20, 12),
                      onPressed: () {
                        if (buttonSms.state) river.startTimer();
                      },
                      color: (buttonSms.state)
                          ? brownGoldColor
                          : brownGoldColor.withOpacity(0.5),
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0),
                      ),
                      child: Text(
                        "REQUEST NEW CODE",
                        style: m15.copyWith(letterSpacing: 2),
                      ),
                    ),
                    SizedBox(
                      height: 16.5.h,
                    ),
                  ],
                ),
              );
            }),
          ],
        ));
  }
}
