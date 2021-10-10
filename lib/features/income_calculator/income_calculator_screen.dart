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
