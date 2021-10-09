import 'package:dti_calculator/features/disclaimer/disclaimer_screen.dart';
import 'package:dti_calculator/features/income_calculator/income_calculator_screen.dart';
import 'package:dti_calculator/features/mortgage_ratio_calculator/calculation_result/calculation_result_screen.dart';
import 'package:dti_calculator/features/mortgage_ratio_calculator/debt_calculator/debt_calculator_screen.dart';
import 'package:dti_calculator/features/mortgage_ratio_calculator/other_payments/other_payments_screen.dart';
import 'package:dti_calculator/features/mortgage_ratio_calculator/student_loan/student_loan_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DTI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: OtherPaymentsScreen(),
    );
  }
}
