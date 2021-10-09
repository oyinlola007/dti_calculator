import 'package:dti_calculator/features/income_calculator/widget/hourly_employee_widget.dart';
import 'package:dti_calculator/core/widget/value_and_next_button_widget.dart';
import 'package:dti_calculator/res/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/income_calculator_bloc.dart';
import 'widget/drop_down_button_widget.dart';
import 'widget/salary_employee_widget.dart';

class IncomeCalculatorScreen extends StatefulWidget {
  const IncomeCalculatorScreen({Key? key}) : super(key: key);

  @override
  _IncomeCalculatorScreenState createState() => _IncomeCalculatorScreenState();
}

class _IncomeCalculatorScreenState extends State<IncomeCalculatorScreen> {
  List<String> employeeTypes = [Strings.hourlyEmployee, Strings.monthlyEmployee];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Income Calculation"),
        centerTitle: true,
        // backgroundColor: AppColors.primaryColor,
      ),
      body: BlocBuilder<IncomeCalculatorBloc, IncomeCalculatorState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  DropdownButtonWidget(
                    Strings.hourlyEmployee,
                    (String newValue) {
                      context.read<IncomeCalculatorBloc>().add(UpdateEmployeeType(newValue));
                    },
                    employeeTypes,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  // Container(
                  //   // margin: EdgeInsets.only(left: 8, right: 8, bottom: 8),
                  //   margin: EdgeInsets.fromLTRB(8, 4, 8, 4),
                  //   padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                  //   decoration: BoxDecoration(
                  //     color: Color(0xffD9DBFB),
                  //     borderRadius: BorderRadius.circular(8),
                  //   ),
                  //   child: TextField(
                  //     style: TextStyle(
                  //       color: Color(0xff797CC0),
                  //       fontSize: 18,
                  //     ),
                  //     decoration: InputDecoration(
                  //       hintText: "Enter monthly salary ",
                  //       // prefixIcon: Icon(CupertinoIcons.money_dollar, color: Colors.black),
                  //       hintStyle: TextStyle(color: Color(0xff797CC0)),
                  //       border: InputBorder.none,
                  //     ),
                  //     onEditingComplete: () {
                  //       // context.read<StaffSearchBloc>()..add(SearchStaff());
                  //       // FocusScopeNode currentFocus = FocusScope.of(context);
                  //       //
                  //       // if (!currentFocus.hasPrimaryFocus) {
                  //       //   currentFocus.unfocus();
                  //       // }
                  //     },
                  //     // onChanged: (value) => context.read<StaffSearchBloc>()..add(SetStaffSearchKeyword(value)),
                  //
                  //     inputFormatters: <TextInputFormatter>[
                  //       CurrencyTextInputFormatter(
                  //         decimalDigits: 0,
                  //         locale: 'en',
                  //       )
                  //     ],
                  //     keyboardType: TextInputType.number,
                  //   ),
                  // ),
                  state.employeeType == Strings.hourlyEmployee
                      ? HourlyEmployeeWidget()
                      : SalaryEmployeeWidget(),
                  MonthlyIncomeValueWidget(
                    title: "Your Monthly income is show below: ",
                    value: state.monthlyIncome.toString(),
                    onPressAction: onPressAction,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  onPressAction() {
    print("Pressed");
  }
}
