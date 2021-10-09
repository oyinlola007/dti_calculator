import 'package:flutter/material.dart';

class StudentLoanScreen extends StatefulWidget {
  const StudentLoanScreen({Key? key}) : super(key: key);

  @override
  _StudentLoanScreenState createState() => _StudentLoanScreenState();
}

class _StudentLoanScreenState extends State<StudentLoanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Loan Section"),
        centerTitle: true,
        // backgroundColor: AppColors.primaryColor,
      ),
    );
  }
}
