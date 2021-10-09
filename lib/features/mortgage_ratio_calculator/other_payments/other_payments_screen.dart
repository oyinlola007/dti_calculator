import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtherPaymentsScreen extends StatefulWidget {
  const OtherPaymentsScreen({Key? key}) : super(key: key);

  @override
  _OtherPaymentsScreenState createState() => _OtherPaymentsScreenState();
}

class _OtherPaymentsScreenState extends State<OtherPaymentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payments"),
        centerTitle: true,
        // backgroundColor: AppColors.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SalesPriceOfHome(),
              SizedBox(
                height: 18,
              ),
              InterestRate(),
              SizedBox(
                height: 18,
              ),
              TermInYears(),
              SizedBox(
                height: 18,
              ),
              DownPayment(),
              SizedBox(
                height: 18,
              ),
              Divider(),
              SizedBox(
                height: 18,
              ),
              YearlyTaxes(),
              SizedBox(
                height: 18,
              ),
              YearlyInsurance(),
              SizedBox(
                height: 18,
              ),
              MonthlyMortgageInsurance(),
              SizedBox(
                height: 18,
              ),
              HOAMonthlyPayment(),
              SizedBox(
                height: 18,
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                  child: Text(
                    'Show Result',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SalesPriceOfHome extends StatelessWidget {
  const SalesPriceOfHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(left: 8, right: 8, bottom: 8),
      margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
      padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
      decoration: BoxDecoration(
        color: Color(0xffD9DBFB),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        style: TextStyle(
          color: Colors.black,
        ),
        decoration: InputDecoration(
          labelText: "Sales Price of Home",
          // prefixIcon: Icon(CupertinoIcons.money_dollar, color: Colors.black38),
          // hintStyle: TextStyle(color: Color(0xff797CC0)),
          labelStyle: TextStyle(color: Colors.black38),
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
          CurrencyTextInputFormatter(
            decimalDigits: 0,
            locale: 'en',
          )
        ],
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class InterestRate extends StatelessWidget {
  const InterestRate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(left: 8, right: 8, bottom: 8),
      margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
      padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
      decoration: BoxDecoration(
        color: Color(0xffD9DBFB),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        style: TextStyle(
          color: Colors.black,
          // fontSize: 16,
        ),
        decoration: InputDecoration(
          labelText: "Interest Rate",
          // prefixIcon: Icon(CupertinoIcons.money_dollar, color: Colors.black38),
          // hintStyle: TextStyle(color: Color(0xff797CC0)),
          labelStyle: TextStyle(color: Colors.black38),

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
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class TermInYears extends StatelessWidget {
  const TermInYears({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(left: 8, right: 8, bottom: 8),
      margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
      padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
      decoration: BoxDecoration(
        color: Color(0xffD9DBFB),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
        decoration: InputDecoration(
          labelText: "Term in years",
          // prefixIcon: Icon(CupertinoIcons.money_dollar, color: Colors.black38),
          // hintStyle: TextStyle(color: Color(0xff797CC0)),
          labelStyle: TextStyle(color: Colors.black38),

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
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class DownPayment extends StatelessWidget {
  const DownPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(left: 8, right: 8, bottom: 8),
      margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
      padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
      decoration: BoxDecoration(
        color: Color(0xffD9DBFB),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        style: TextStyle(
          color: Colors.black,
        ),
        decoration: InputDecoration(
          labelText: "Down Payment",
          // hintText: "Down Payment",
          // prefixIcon: Icon(CupertinoIcons.money_dollar, color: Colors.black38),
          labelStyle: TextStyle(color: Colors.black38),
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
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class YearlyTaxes extends StatelessWidget {
  const YearlyTaxes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(left: 8, right: 8, bottom: 8),
      margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
      padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
      decoration: BoxDecoration(
        color: Color(0xffD9DBFB),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        style: TextStyle(
          color: Colors.black,
        ),
        decoration: InputDecoration(
          labelText: "Yearly Taxes",
          // prefixIcon: Icon(CupertinoIcons.money_dollar, color: Colors.black38),
          // hintStyle: TextStyle(color: Color(0xff797CC0)),
          labelStyle: TextStyle(color: Colors.black38),
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
          CurrencyTextInputFormatter(
            decimalDigits: 0,
            locale: 'en',
          )
        ],
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class YearlyInsurance extends StatelessWidget {
  const YearlyInsurance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(left: 8, right: 8, bottom: 8),
      margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
      padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
      decoration: BoxDecoration(
        color: Color(0xffD9DBFB),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        style: TextStyle(
          color: Colors.black,
        ),
        decoration: InputDecoration(
          labelText: "Yearly Insurance",
          // prefixIcon: Icon(CupertinoIcons.money_dollar, color: Colors.black38),
          // hintStyle: TextStyle(color: Color(0xff797CC0)),
          labelStyle: TextStyle(color: Colors.black38),
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
          CurrencyTextInputFormatter(
            decimalDigits: 0,
            locale: 'en',
          )
        ],
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class MonthlyMortgageInsurance extends StatelessWidget {
  const MonthlyMortgageInsurance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(left: 8, right: 8, bottom: 8),
      margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
      padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
      decoration: BoxDecoration(
        color: Color(0xffD9DBFB),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        style: TextStyle(
          color: Colors.black,
        ),
        decoration: InputDecoration(
          labelText: "Monthly Mortgage Insurance",
          // prefixIcon: Icon(CupertinoIcons.money_dollar, color: Colors.black38),
          // hintStyle: TextStyle(color: Color(0xff797CC0)),
          labelStyle: TextStyle(color: Colors.black38),
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
          CurrencyTextInputFormatter(
            decimalDigits: 0,
            locale: 'en',
          )
        ],
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class HOAMonthlyPayment extends StatelessWidget {
  const HOAMonthlyPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(left: 8, right: 8, bottom: 8),
      margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
      padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
      decoration: BoxDecoration(
        color: Color(0xffD9DBFB),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        style: TextStyle(
          color: Colors.black,
        ),
        decoration: InputDecoration(
          labelText: "HOA Monthly Payment",
          // prefixIcon: Icon(CupertinoIcons.money_dollar, color: Colors.black38),
          // hintStyle: TextStyle(color: Color(0xff797CC0)),
          labelStyle: TextStyle(color: Colors.black38),
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
          CurrencyTextInputFormatter(
            decimalDigits: 0,
            locale: 'en',
          )
        ],
        keyboardType: TextInputType.number,
      ),
    );
  }
}
