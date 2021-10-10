import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:dti_calculator/features/income_calculator/bloc/income_calculator_bloc.dart';
import 'package:dti_calculator/res/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'drop_down_button_widget.dart';

class SalaryEmployeeWidget extends StatefulWidget {
  const SalaryEmployeeWidget({Key? key}) : super(key: key);

  @override
  _SalaryEmployeeWidgetState createState() => _SalaryEmployeeWidgetState();
}

class _SalaryEmployeeWidgetState extends State<SalaryEmployeeWidget> {
  List<String> salaryTypes = [
    Strings.paidPerMonth,
    Strings.paidTwicePerMonth,
    Strings.paidTwicePerWeekYouGetAnExtraPay,
    Strings.paidWeekly,
  ];

  final CurrencyTextInputFormatter _formatter = CurrencyTextInputFormatter();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IncomeCalculatorBloc, IncomeCalculatorState>(
      builder: (context, state) {
        return Container(
          child: Column(
            children: [
              SizedBox(
                height: 16,
              ),
              DropdownButtonWidget(Strings.paidPerMonth, (String newValue) {
                context.read<IncomeCalculatorBloc>().add(UpdateSalaryType(newValue));
              }, salaryTypes),
              SizedBox(
                height: 16,
              ),
              if (state.salaryType == Strings.paidPerMonth) _PaidPerMonth(formatter: _formatter),
              if (state.salaryType == Strings.paidTwicePerMonth)
                _PaidTwicePerMonth(formatter: _formatter),
              if (state.salaryType == Strings.paidTwicePerWeekYouGetAnExtraPay)
                _PaidTwicePerWeekYouGetAnExtraPay(formatter: _formatter),
              if (state.salaryType == Strings.paidWeekly) _PaidWeekly(formatter: _formatter)
            ],
          ),
        );
      },
    );
  }
}

class _PaidPerMonth extends StatelessWidget {
  const _PaidPerMonth({Key? key, required this.formatter}) : super(key: key);

  final CurrencyTextInputFormatter formatter;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IncomeCalculatorBloc, IncomeCalculatorState>(
      builder: (context, state) {
        return Container(
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
              hintText: "Enter amount paid per month",
              // prefixIcon: Icon(CupertinoIcons.money_dollar, color: Colors.black),
              hintStyle: TextStyle(color: Color(0xff797CC0)),
              border: InputBorder.none,
            ),
            onEditingComplete: () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            onChanged: (value) => context.read<IncomeCalculatorBloc>()
              ..add(UpdatePayPerMonth(formatter.getUnformattedValue())),
            inputFormatters: <TextInputFormatter>[
              formatter,
            ],
            keyboardType: TextInputType.number,
          ),
        );
      },
    );
  }
}

class _PaidTwicePerMonth extends StatelessWidget {
  const _PaidTwicePerMonth({Key? key, required this.formatter}) : super(key: key);

  final CurrencyTextInputFormatter formatter;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IncomeCalculatorBloc, IncomeCalculatorState>(
      builder: (context, state) {
        return Container(
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
              hintText: "Enter amount",
              // prefixIcon: Icon(CupertinoIcons.money_dollar, color: Colors.black),
              hintStyle: TextStyle(color: Color(0xff797CC0)),
              border: InputBorder.none,
            ),
            onEditingComplete: () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            onChanged: (value) => context.read<IncomeCalculatorBloc>()
              ..add(UpdatePayTwicePerMonth(formatter.getUnformattedValue())),
            inputFormatters: <TextInputFormatter>[
              formatter,
            ],
            keyboardType: TextInputType.number,
          ),
        );
      },
    );
  }
}

class _PaidTwicePerWeekYouGetAnExtraPay extends StatelessWidget {
  const _PaidTwicePerWeekYouGetAnExtraPay({Key? key, required this.formatter}) : super(key: key);

  final CurrencyTextInputFormatter formatter;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IncomeCalculatorBloc, IncomeCalculatorState>(
      builder: (context, state) {
        return Container(
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
              hintText: "Enter amount",
              // prefixIcon: Icon(CupertinoIcons.money_dollar, color: Colors.black),
              hintStyle: TextStyle(color: Color(0xff797CC0)),
              border: InputBorder.none,
            ),
            onEditingComplete: () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            onChanged: (value) => context.read<IncomeCalculatorBloc>()
              ..add(UpdatePayTwiceAWeekYouGetExtra(formatter.getUnformattedValue())),
            inputFormatters: <TextInputFormatter>[
              formatter,
            ],
            keyboardType: TextInputType.number,
          ),
        );
      },
    );
  }
}

class _PaidWeekly extends StatelessWidget {
  const _PaidWeekly({Key? key, required this.formatter}) : super(key: key);

  final CurrencyTextInputFormatter formatter;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IncomeCalculatorBloc, IncomeCalculatorState>(
      builder: (context, state) {
        return Container(
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
              hintText: "Enter amount",
              // prefixIcon: Icon(CupertinoIcons.money_dollar, color: Colors.black),
              hintStyle: TextStyle(color: Color(0xff797CC0)),
              border: InputBorder.none,
            ),
            onEditingComplete: () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            onChanged: (value) => context.read<IncomeCalculatorBloc>()
              ..add(UpdatePayWeekly(formatter.getUnformattedValue())),
            inputFormatters: <TextInputFormatter>[
              formatter,
            ],
            keyboardType: TextInputType.number,
          ),
        );
      },
    );
  }
}
