import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/loading_screen/loading_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../color_plate.dart';

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

class VerificationPage extends ConsumerWidget {
  const VerificationPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final w = MediaQuery.of(context).size.width;
    final w5 = MediaQuery.of(context).size.width / 5;
    final height = MediaQuery.of(context).size.height - kToolbarHeight;
    final river = watch(smsRiverpod);
    final buttonSms = watch(smsButtonState);
    return Scaffold(
        resizeToAvoidBottomPadding: true,
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
              top: kToolbarHeight,
              right: 18,
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: SvgPicture.asset('assets/icons/close.svg'),
              ),
            ),
            Container(
              width: double.infinity,
              constraints: new BoxConstraints(
                minHeight: height,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //1 222 555 6677

                        Text(
                          "Enter the 4 digit code sent to:",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontFamily: 'avenirB'),
                          textAlign: TextAlign.center,
                        ),

                        Text(
                          "1 222 555 6677",
                          style: TextStyle(
                              color: brownGoldColor,
                              fontSize: 30,
                              fontFamily: 'avenirB'),
                          textAlign: TextAlign.center,
                        ),

                        SizedBox(height: 9.5),

                        Text(
                            "We've sent a 4 digit code to your phone number. \n Please enter the verification code.",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'avenirB',
                            ),
                            textAlign: TextAlign.center),

                        SizedBox(
                          height: 49.5,
                        ),

                        Container(
                          width: w * 0.8,
                          height: 100,
                          child: PinCodeTextField(
                            appContext: context,
                            length: 4,
                            obscureText: false,
                            animationType: AnimationType.fade,
                            textStyle: TextStyle(
                              fontFamily: 'avenirM',
                              fontSize: 24,
                            ),
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.underline,
                              borderWidth: 1,
                              fieldHeight: 42,
                              fieldWidth: 54,
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
                              print("Completed");
                            },
                            onChanged: (value) {
                              if (value.length == 4)
                                buttonSms.state = true;
                              else
                                buttonSms.state = false;
                              print(value);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text("Didn’t receive the SMS?",
                      style: TextStyle(
                        color: (river.start == 10)
                            ? Color(0xff676870)
                            : Colors.black,
                        fontSize: 14,
                        fontFamily: 'avenirB',
                      ),
                      textAlign: TextAlign.center),
                  Text(
                      (river.start == 10)
                          ? "Request new code in 00:00"
                          : "Request new code in 00:${river.start}",
                      style: TextStyle(
                        color:
                            (river.start == 10) ? Colors.black : brownGoldColor,
                        fontSize: 14,
                        fontFamily: 'avenirB',
                      ),
                      textAlign: TextAlign.center),
                  SizedBox(
                    height: 30,
                  ),
                  FlatButton(
                    minWidth: w5 * 3,
                    padding: EdgeInsets.fromLTRB(20, 12, 20, 12),
                    onPressed: () {
                      if (buttonSms.state) river.startTimer();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoadingPage(nextPage: '/verified',)),
                        );
                    },
                    color: (buttonSms.state)
                        ? brownGoldColor
                        : brownGoldColor.withOpacity(0.5),
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22.0),
                    ),
                    child: Text(
                      "RECOVER EMAIL",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'avenirM',
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.5,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
