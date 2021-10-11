import 'package:dti_calculator/features/disclaimer/presentation/disclaimer_screen.dart';
import 'package:dti_calculator/features/income_calculator/income_calculator_screen.dart';
import 'package:dti_calculator/features/mortgage_ratio_calculator/calculation_result/calculation_result_screen.dart';
import 'package:flutter/material.dart';
import 'page_route_constants.dart';

class ScreenRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteConstants.disclaimerScreen:
        return MaterialPageRoute(
          builder: (_) => DisclaimerScreen(),
        );
      case PageRouteConstants.incomeCalculatorScreen:
        return MaterialPageRoute(
          builder: (_) => IncomeCalculatorScreen(),
        );

      // static const String loanCalculatorScreen = '/loanCalculatorScreen';
      // static const String debtCalculatorScreen = '/debtCalculatorScreen';
      // static const String otherCalculationScreen = '/otherCalculationScreen';

      case PageRouteConstants.calculationResultScreen:
        return MaterialPageRoute(
          builder: (_) => CalculationResultScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
