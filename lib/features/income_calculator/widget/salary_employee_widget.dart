import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'drop_down_button_widget.dart';

class SalaryEmployeeWidget extends StatefulWidget {
  const SalaryEmployeeWidget({Key? key}) : super(key: key);

  @override
  _SalaryEmployeeWidgetState createState() => _SalaryEmployeeWidgetState();
}

class _SalaryEmployeeWidgetState extends State<SalaryEmployeeWidget> {
  String salaryType = "Paid Per Month";
  List<String> salaryTypes = [
    'Paid Per Month',
    'Paid Twice Per Month',
    'Paid Twice per Week (you get an extra pay check twice a year)',
    'Paid Weekly',
  ];

  final CurrencyTextInputFormatter _formatter = CurrencyTextInputFormatter();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 16,
          ),
          DropdownButtonWidget(salaryType, setSalaryType, salaryTypes),
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
                hintText: "Enter amount ",
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
        ],
      ),
    );
  }

  setSalaryType(String newValue) {
    setState(() {
      salaryType = newValue;
    });
  }
}
