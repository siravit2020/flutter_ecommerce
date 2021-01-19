import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
final titleAppbarState = StateProvider<String>((ref) {
  return 'STORE';
});
final actionAbbbarFav = StateProvider<bool>((ref) {
  return false;
});