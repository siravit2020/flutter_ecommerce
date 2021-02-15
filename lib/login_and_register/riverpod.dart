import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final visiblePassword = ChangeNotifierProvider<VisiblePassword>((ref) {
  return VisiblePassword();
});

final testControllerChange =
    ChangeNotifierProvider<TestControllerChange>((ref) {
  return TestControllerChange();
});
final passwordColorState = StateProvider<bool>((ref) {
  return false;
});
class VisiblePassword extends ChangeNotifier {
  bool password = true;
  void change() {
    password = !password;
    notifyListeners();
  }
}

class TestControllerChange extends ChangeNotifier {
  String username;
  String email;
  String pass;
  String phone;
}