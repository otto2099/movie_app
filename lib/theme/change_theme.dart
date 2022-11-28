import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:movie_app/theme/app_theme.dart';

class ChangeTheme extends GetxController {
  final box = GetStorage();

  bool get isDark => box.read('darkmode') ?? false;
  ThemeData get theme => isDark ? AppTheme.lightTheme : AppTheme.darkTheme;
  ThemeMode get themeMode => isDark ? ThemeMode.light : ThemeMode.light;

  void changeTheme(bool val) => box.write('darkmode', val);
}
