import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:dti_calculator/features/income_calculator/bloc/income_calculator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HourlyEmployeeWidget extends StatefulWidget {
  const HourlyEmployeeWidget({Key? key}) : super(key: key);

  @override
  _HourlyEmployeeWidgetState createState() => _HourlyEmployeeWidgetState();
}

class _HourlyEmployeeWidgetState extends State<HourlyEmployeeWidget> {
  final CurrencyTextInputFormatter formatter = CurrencyTextInputFormatter();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IncomeCalculatorBloc, IncomeCalculatorState>(
      builder: (context, state) {
        return Container(
          child: Column(
            children: [
              SizedBox(
                height: 22,
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
                    hintText: "Income per hour",
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
                  onChanged: (value) {
                    if (value != "") {
                      context
                          .read<IncomeCalculatorBloc>()
                          .add(UpdateIncomePerHour(formatter.getUnformattedValue()));
                    }
                  },
                  inputFormatters: <TextInputFormatter>[
                    formatter,
                  ],
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(
                height: 8,
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
                    hintText: "Number of hours per week",
                    hintStyle: TextStyle(color: Color(0xff797CC0)),
                    border: InputBorder.none,
                  ),
                  onEditingComplete: () {
                    FocusScopeNode currentFocus = FocusScope.of(context);

                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                  },
                  onChanged: (value) {
                    if (value != "") {
                      context
                          .read<IncomeCalculatorBloc>()
                          .add(UpdateNumberOfHoursPerWeek(num.parse(value)));
                    }
                  },
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(
                height: 22,
              ),
            ],
          ),
        );
      },
    );
  }
}
