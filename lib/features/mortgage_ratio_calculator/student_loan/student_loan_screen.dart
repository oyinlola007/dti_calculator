import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:dti_calculator/core/widget/value_and_next_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StudentLoanScreen extends StatefulWidget {
  const StudentLoanScreen({Key? key}) : super(key: key);

  @override
  _StudentLoanScreenState createState() => _StudentLoanScreenState();
}

class _StudentLoanScreenState extends State<StudentLoanScreen> {
  String selectedValue = "";

  @override
  Widget build(BuildContext context) {
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
                          primary: selectedValue == "YES" ? Colors.deepPurple : Colors.grey,
                          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                      child: Text(
                        'YES',
                        style: TextStyle(fontSize: 18),
                      ),
                      onPressed: () {
                        setState(() {
                          selectedValue = "YES";
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: selectedValue == "NO" ? Colors.deepPurple : Colors.grey,
                          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                      child: Text(
                        'NO',
                        style: TextStyle(fontSize: 18),
                      ),
                      onPressed: () {
                        setState(() {
                          selectedValue = "NO";
                        });
                      },
                    ),
                  ),
                  // InkWell(
                  //   onTap: () {
                  //     setState(() {
                  //       selectedValue = "YES";
                  //     });
                  //   },
                  //   child: Container(
                  //     width: 80,
                  //     height: 80,
                  //     color: selectedValue == "YES" ? Color(0xff35107F) : Colors.white,
                  //     child: Center(
                  //       child: Text(
                  //         "YES",
                  //         style: TextStyle(
                  //             color: selectedValue == "YES" ? Colors.white : Color(0xff35107F)),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // InkWell(
                  //   onTap: () {
                  //     setState(() {
                  //       selectedValue = "NO";
                  //     });
                  //   },
                  //   child: Container(
                  //     width: 80,
                  //     height: 80,
                  //     color: selectedValue == "NO" ? Color(0xff35107F) : Colors.white,
                  //     child: Center(
                  //       child: Text(
                  //         "NO",
                  //         style: TextStyle(
                  //             color: selectedValue == "NO" ? Colors.white : Color(0xff35107F)),
                  //       ),
                  //     ),
                  //   ),
                  // )
                ],
              ),
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
                  // onChanged: (value) => context.read<StaffSearchBloc>()..add(SetStaffSearchKeyword(value)),
                  onChanged: (String val) {},
                  inputFormatters: <TextInputFormatter>[
                    CurrencyTextInputFormatter(
                      decimalDigits: 0,
                      locale: 'en',
                    )
                  ],
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(
                height: 22,
              ),
              MonthlyIncomeValueWidget(
                title: "Total Loan Amount is show below: ",
                value: "\$0",
                onPressAction: onPressAction,
              )
            ],
          ),
        ),
      ),
    );
  }

  onPressAction() {
    print("Pressed");
  }
}
