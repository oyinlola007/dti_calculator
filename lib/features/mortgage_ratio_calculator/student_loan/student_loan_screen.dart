import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:dti_calculator/core/widget/value_and_next_button_widget.dart';
import 'package:dti_calculator/features/debt_calculator/debt_calculator_screen.dart';
import 'package:dti_calculator/res/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/student_loan_bloc.dart';

class StudentLoanScreen extends StatefulWidget {
  final num monthlyIncome;
  const StudentLoanScreen({Key? key, required this.monthlyIncome}) : super(key: key);

  @override
  _StudentLoanScreenState createState() => _StudentLoanScreenState();
}

class _StudentLoanScreenState extends State<StudentLoanScreen> {
  // String selectedValue = "";
  final CurrencyTextInputFormatter formatter = CurrencyTextInputFormatter();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentLoanBloc, StudentLoanState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Loan Section"),
            centerTitle: true,
            // backgroundColor: AppColors.primaryColor,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    "Do you have Student Loans?",
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: state.doYouHaveStudentLoan == "YES"
                                  ? Colors.deepPurple
                                  : Colors.grey,
                              // primary:   selectedValue == "YES" ? Colors.deepPurple : Colors.grey,
                              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                              shape:
                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                          child: Text(
                            'YES',
                            style: TextStyle(fontSize: 18),
                          ),
                          onPressed: () {
                            context.read<StudentLoanBloc>().add(UpdateDoYouHaveStudentLoan("YES"));
                            // setState(() {
                            //   selectedValue = "YES";
                            // });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: state.doYouHaveStudentLoan == "NO"
                                  ? Colors.deepPurple
                                  : Colors.grey,
                              // primary: selectedValue == "NO" ? Colors.deepPurple : Colors.grey,
                              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                              shape:
                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                          child: Text(
                            'NO',
                            style: TextStyle(fontSize: 18),
                          ),
                          onPressed: () {
                            context.read<StudentLoanBloc>().add(UpdateDoYouHaveStudentLoan("NO"));
                            // setState(() {
                            //   selectedValue = "NO";
                            // });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Visibility(
                    visible: state.doYouHaveStudentLoan == "YES",
                    child: Container(
                      // margin: EdgeInsets.only(left: 8, right: 8, bottom: 8),
                      margin: EdgeInsets.fromLTRB(8, 4, 8, 4),
                      padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                      decoration: BoxDecoration(
                        color: Color(0xffD9DBFB),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextFormField(
                        style: TextStyle(
                          color: Color(0xff797CC0),
                          fontSize: 18,
                        ),
                        decoration: InputDecoration(
                          hintText: "Enter total Loan Amount",
                          // prefixIcon: Icon(CupertinoIcons.money_dollar, color: Colors.black),
                          hintStyle: TextStyle(color: Color(0xff797CC0)),
                          border: InputBorder.none,
                        ),
                        onEditingComplete: () {
                          // context.read<StaffSearchBloc>()..add(SearchStaff());
                          FocusScopeNode currentFocus = FocusScope.of(context);
                          //
                          if (!currentFocus.hasPrimaryFocus) {
                            currentFocus.unfocus();
                          }
                        },
                        onChanged: (value) {
                          if (value != "") {
                            context
                                .read<StudentLoanBloc>()
                                .add(UpdateStudentLoanValue(formatter.getUnformattedValue()));
                          }
                        },
                        inputFormatters: <TextInputFormatter>[
                          formatter,
                        ],
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  MonthlyIncomeValueWidget(
                    title: "Debt Estimate ",
                    value: 'USD ${state.loanAmount}',
                    onPressAction: () {
                      print("===> Monthly Income ${widget.monthlyIncome}");
                      print("===> Loan Amount ${state.loanAmount}");

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DebtCalculatorScreen(
                            monthlyIncome: widget.monthlyIncome,
                            loanAmount: state.loanAmount,
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                    "NOTE!",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    Strings.loanDisclaimer,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                    child: Text(
                      'Skip',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      context.read<StudentLoanBloc>().add(ClearStudentLoan());

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DebtCalculatorScreen(
                            monthlyIncome: widget.monthlyIncome,
                            loanAmount: 0,
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
