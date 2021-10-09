import 'package:flutter/material.dart';

import 'colors.dart';
import 'font_family.dart';

class AppTheme {
  AppTheme._();

  static get getLightTheme => ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily: FontFamily.quicksand,
      brightness: Brightness.light,
      primarySwatch: MaterialColor(AppColors.dtiCalculator[500]!.value, AppColors.dtiCalculator),
      primaryColor: AppColors.dtiCalculator[500],
      primaryColorBrightness: Brightness.light,
      accentColor: AppColors.dtiCalculator[500],
      accentColorBrightness: Brightness.light);

  static get getDarkTheme => ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: FontFamily.quicksand,
        brightness: Brightness.dark,
        primaryColor: AppColors.darkPrimaryColor,
        primaryColorBrightness: Brightness.dark,
        accentColor: AppColors.dtiCalculator[500],
        accentColorBrightness: Brightness.dark,
      );
}
