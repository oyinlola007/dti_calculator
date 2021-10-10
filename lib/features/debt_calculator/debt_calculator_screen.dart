import 'dart:convert';

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:dti_calculator/core/widget/value_and_next_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DebtCalculatorScreen extends StatefulWidget {
  final num monthlyIncome;
  final num loanAmount;
  const DebtCalculatorScreen({Key? key, required this.monthlyIncome, required this.loanAmount})
      : super(key: key);

  @override
  _DebtCalculatorScreenState createState() => _DebtCalculatorScreenState();
}

class _DebtCalculatorScreenState extends State<DebtCalculatorScreen> {
  List<Map<String, dynamic>> _values = [
    {
      "id": 0,
      "value": 0,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Debt Calculation"),
        centerTitle: true,
        // backgroundColor: AppColors.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 16,
              ),
              Text(
                "Total Debt payment in credit report",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 16,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: _values.length,
                itemBuilder: (context, index) {
                  return _row(index);
                },
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    TextButton.icon(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                      ),
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          _values.add({
                            "id": _values.length,
                            "value": 0,
                          });
                        });
                      },
                      label: Text(
                        "Add New Field",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                      ),
                      onPressed: () {
                        var encoder = JsonEncoder.withIndent('    ');
                        print(encoder.convert(_values));
                      },
                      child: Text(
                        "Print values",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 22,
              ),
              MonthlyIncomeValueWidget(
                title: "Total Debt Amount is show below: ",
                value: "\$0",
                onPressAction: onPressAction,
              )
            ],
          ),
        ),
      ),
    );
  }

  _row(int index) {
    return Row(
      children: [
        Expanded(
          flex: 9,
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
                hintText: "Debt ${index + 1} ",
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
              // onChanged: (value) => context.read<StaffSearchBloc>()..add(SetStaffSearchKeyword(value)),
              onChanged: (String val) {
                _onUpdate(index, val);
              },
              inputFormatters: <TextInputFormatter>[
                CurrencyTextInputFormatter(
                  decimalDigits: 0,
                  locale: 'en',
                )
              ],
              keyboardType: TextInputType.number,
            ),
          ),
          // child: TextFormField(
          //   onChanged: (val) {
          //     _onUpdate(index, val);
          //   },
          // ),
        ),
        Expanded(
          child: Visibility(
            visible: index == 0 ? false : true,
            child: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(
                  () {
                    _values.removeAt(index);
                  },
                );
              },
            ),
          ),
        )
      ],
    );
  }

  _onUpdate(int index, String val) async {
    int foundKey = -1;
    for (var map in _values) {
      if (map.containsKey("id")) {
        if (map["id"] == index) {
          foundKey = index;
          break;
        }
      }
    }
    if (-1 != foundKey) {
      _values.removeWhere((map) {
        return map["id"] == foundKey;
      });
    }
    Map<String, dynamic> json = {
      "id": index,
      "value": val,
    };
    _values.add(json);
  }

  onPressAction() {
    print("Pressed");
  }
}
