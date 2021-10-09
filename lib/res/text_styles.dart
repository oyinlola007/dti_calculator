import 'dart:ui';

import 'package:flutter/material.dart';

import 'colors.dart';

class TextStyles {
  TextStyles._();

  static const headerTextStyle = const TextStyle(
      fontSize: 32.0,
      fontWeight: FontWeight.w800,
      color: AppColors.headerTextColor);

  static const subHeaderTextStyle = const TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w800,
  );

  static const unselectedTabTextStyle = const TextStyle(
    fontWeight: FontWeight.w600,
    color: Colors.grey,
  );

  static const selectedTabTextStyle = const TextStyle(
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor,
  );
}
