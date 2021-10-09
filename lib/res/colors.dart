import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const int _dtiCalculatorPrimaryValue = 0xFF35107F;
  static const primaryColor = const Color(_dtiCalculatorPrimaryValue);

  static const Map<int, Color> dtiCalculator = const <int, Color>{
    50: Color(0xFF35107F),
    100: Color(0xFFB3DCD7),
    200: Color(0xFF80C4BD),
    300: Color(0xFF4DACA3),
    400: Color(0xFF269B8F),
    500: Color(_dtiCalculatorPrimaryValue),
    600: Color(0xFF008173),
    700: Color(0xFF007668),
    800: Color(0xFF006C5E),
    900: Color(0xFF00594B),
  };

  static const int _dtiCalculatorDarkPrimaryValue = 0xFF1F1F1F;

  static const darkPrimaryColor = const Color(_dtiCalculatorDarkPrimaryValue);

  static const Map<int, Color> dtiCalculatorDark = const <int, Color>{
    50: Color(0xFFE0F1EF),
    100: Color(0xFFB3DCD7),
    200: Color(0xFF80C4BD),
    300: Color(0xFF4DACA3),
    400: Color(0xFF269B8F),
    500: Color(_dtiCalculatorPrimaryValue),
    600: Color(0xFF008173),
    700: Color(0xFF007668),
    800: Color(0xFF006C5E),
    900: Color(0xFF00594B),
  };

  static const int _dtiCalculatorAccentValue = 0xFF58FFDF;

  static const MaterialColor dtiCalculatorAccent =
      MaterialColor(_dtiCalculatorAccentValue, <int, Color>{
    100: Color(0xFF8BFFE9),
    200: Color(_dtiCalculatorAccentValue),
    400: Color(0xFF25FFD5),
    700: Color(0xFF0BFFD0),
  });

  static const statusBarColor = Colors.white;
  static const appBarColor = Colors.white;
  static const scaffoldColor = Colors.white;

  static const headerTextColor = const Color(0xFF120E4C);
  static const notificationSectionColor = const Color(0xFF1D2637);

  // static const orange = const Color(0xFFFFAC00);
  static const red = const Color(0xFFEE604E);
  static const blue = const Color(0xFF7D7DE3);
  static const unselectedCardColor = const Color(0xFFF6F6F6);
}
