import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

FirebaseAuth auth = FirebaseAuth.instance;

class GoogleAndFacebook extends StatelessWidget {
  const GoogleAndFacebook({
    Key key,
    @required this.type,
  }) : super(key: key);

  final bool type;
  void showSnack(BuildContext ctx, String title) {
    final snackBar = SnackBar(content: Text(title));
    Scaffold.of(ctx).showSnackBar(snackBar);
  }

  void face(BuildContext context) async {
    final facebookLogin = FacebookLogin();

    final result = await facebookLogin.logIn(['email', 'public_profile']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        // _sendTokenToServer(result.accessToken.token);
        // _showLoggedInUI();

        String token = result.accessToken.token;
        final graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email,picture&access_token=$token');

        Map profile = jsonDecode(graphResponse.body);
        print("Access token = $token");
        profile.forEach((key, value) {
          print(key);
          print(value);
        });
        await auth
            .signInWithCredential(FacebookAuthProvider.credential(token))
            .catchError((e) => showSnack(context, 'Try Again'))
            .then((value) => Navigator.of(context).pushNamedAndRemoveUntil(
                '/main', (Route<dynamic> route) => false));
        var current = auth.currentUser;

        current.updateProfile(
            displayName: profile['name'],
            photoURL: profile['picture']['data']['url']);

        print(auth.currentUser.displayName);
        print(auth.currentUser.uid);
        print(auth.currentUser.photoURL);
        break;
      case FacebookLoginStatus.cancelledByUser:
        showSnack(context, 'cancle');
        break;
      case FacebookLoginStatus.error:
        showSnack(context, 'facebook error' + result.errorMessage);
        break;
    }
  }

  void loginWithGoogle(BuildContext context) async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );
    GoogleSignInAccount user = await _googleSignIn.signIn();
    print(user.email);
    print(user.displayName);
    print(user.id);
    print(user.id);
    print(user.photoUrl);

    GoogleSignInAuthentication userAuth = await user.authentication;

    await FirebaseAuth.instance
        .signInWithCredential(GoogleAuthProvider.credential(
            idToken: userAuth.idToken, accessToken: userAuth.accessToken))
        .catchError((e) => showSnack(context, 'Try Again'))
        .then((value) => Navigator.of(context)
            .pushNamedAndRemoveUntil('/main', (Route<dynamic> route) => false));
    print(auth.currentUser.email);
    print(auth.currentUser.displayName);
    print(auth.currentUser.uid);
    print(auth.currentUser.photoURL);
    // checkAuth(context); // after success route to home.
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.sw / 5),
      child: FlatButton(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
        onPressed: () {
          if (auth.currentUser == null)
            type ? loginWithGoogle(context) : face(context);
        },
        textColor: type ? const Color(0xffDE4D3B) : const Color(0xff4267B2),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22.0),
            side: BorderSide(
              color: type ? const Color(0xffDE4D3B) : const Color(0xff4267B2),
            )),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: SvgPicture.asset(
                type ? 'assets/icons/google.svg' : 'assets/icons/facebook.svg',
              ),
            ),
            Expanded(
              flex: 4,
              child: Text(
                type ? "Continue with Google" : "Continue with Facebook",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: 'avenirB',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
