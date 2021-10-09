import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:dti_calculator/features/income_calculator/widget/monthly_income_value_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widget/drop_down_button_widget.dart';

class IncomeCalculatorScreen extends StatefulWidget {
  const IncomeCalculatorScreen({Key? key}) : super(key: key);

  @override
  _IncomeCalculatorScreenState createState() => _IncomeCalculatorScreenState();
}

class _IncomeCalculatorScreenState extends State<IncomeCalculatorScreen> {
  String employeeType = "Hourly Employee";
  final CurrencyTextInputFormatter _formatter = CurrencyTextInputFormatter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Income Calculation"),
        centerTitle: true,
        // backgroundColor: AppColors.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              SizedBox(
                height: 16,
              ),
              DropdownButtonWidget(
                employeeType == "Hourly Employee" ? "Hourly Employee" : "Salary Employee",
                setEmployeeType,
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                // margin: EdgeInsets.only(left: 8, right: 8, bottom: 8),
                margin: EdgeInsets.fromLTRB(8, 4, 8, 4),
                padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                decoration: BoxDecoration(
                  color: Color(0xffD9DBFB),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  style: TextStyle(
                    color: Color(0xff797CC0),
                    fontSize: 18,
                  ),
                  decoration: InputDecoration(
                    hintText: "Enter monthly salary ",
                    // prefixIcon: Icon(CupertinoIcons.money_dollar, color: Colors.black),
                    hintStyle: TextStyle(color: Color(0xff797CC0)),
                    border: InputBorder.none,
                  ),
                  onEditingComplete: () {
                    // context.read<StaffSearchBloc>()..add(SearchStaff());
                    // FocusScopeNode currentFocus = FocusScope.of(context);
                    //
                    // if (!currentFocus.hasPrimaryFocus) {
                    //   currentFocus.unfocus();
                    // }
                  },
                  // onChanged: (value) => context.read<StaffSearchBloc>()..add(SetStaffSearchKeyword(value)),

                  inputFormatters: <TextInputFormatter>[
                    _formatter,
                  ],
                  keyboardType: TextInputType.number,
                ),
              ),
              MonthlyIncomeValueWidget()
            ],
          ),
        ),
      ),
    );
  }

  setEmployeeType(String newValue) {
    if (newValue == "Hourly Employee") {
      setState(() {
        employeeType = "Hourly Employee";
      });
    } else {
      setState(() {
        employeeType = "Salary Employee";
      });
    }
  }
}
