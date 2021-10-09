import 'package:dti_calculator/features/disclaimer/disclaimer_screen.dart';
import 'package:dti_calculator/features/income_calculator/income_calculator_screen.dart';
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
      home: IncomeCalculatorScreen(),
    );
  }
}
