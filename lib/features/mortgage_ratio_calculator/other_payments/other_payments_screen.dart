import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:dti_calculator/features/mortgage_ratio_calculator/bloc/mortgage_ratio_calculator_bloc.dart';
import 'package:dti_calculator/features/mortgage_ratio_calculator/calculation_result/calculation_result_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtherPaymentsScreen extends StatefulWidget {
  final num monthlyIncome;
  final num loanAmount;
  final num totalDebt;

  const OtherPaymentsScreen(
      {Key? key, required this.monthlyIncome, required this.loanAmount, required this.totalDebt})
      : super(key: key);

  @override
  _OtherPaymentsScreenState createState() => _OtherPaymentsScreenState();
}

class _OtherPaymentsScreenState extends State<OtherPaymentsScreen> {
  final CurrencyTextInputFormatter formatter =
      CurrencyTextInputFormatter(decimalDigits: 0, locale: 'en');

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MortgageRatioCalculatorBloc, MortgageRatioCalculatorState>(
      builder: (ctx, state) {
        ctx.read<MortgageRatioCalculatorBloc>()
          ..add(UpdateIncomeLoanAndDebt(
              monthlyIncome: widget.monthlyIncome,
              loanAmount: widget.loanAmount,
              totalDebt: widget.totalDebt));
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
                  SalesPriceOfHome(formatter: formatter),
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
                  DownPaymentInUSD(formatter: formatter),
                  SizedBox(
                    height: 8,
                  ),
                  DownPaymentInPercentage(),
                  SizedBox(
                    height: 18,
                  ),
                  Divider(),
                  SizedBox(
                    height: 18,
                  ),
                  YearlyTaxes(formatter: formatter),
                  SizedBox(
                    height: 18,
                  ),
                  YearlyInsurance(formatter: formatter),
                  SizedBox(
                    height: 18,
                  ),
                  MonthlyMortgageInsurance(formatter: formatter),
                  SizedBox(
                    height: 18,
                  ),
                  HOAMonthlyPayment(formatter: formatter),
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
                      onPressed: () {
                        ctx.read<MortgageRatioCalculatorBloc>()..add(ShowResult());

                        Future.delayed(Duration(seconds: 2), () {
                          // Do something
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CalculationResultScreen(
                                totalMortgagePayment: state.totalMortgagePayment,
                                backEndRatio: state.backEndRatio,
                                frontEndRatio: state.frontEndRatio,
                              ),
                            ),
                          );
                        });
                      },
                    ),
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

class SalesPriceOfHome extends StatelessWidget {
  final CurrencyTextInputFormatter formatter;

  const SalesPriceOfHome({Key? key, required this.formatter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MortgageRatioCalculatorBloc, MortgageRatioCalculatorState>(
      builder: (context, state) {
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
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            onChanged: (value) => context.read<MortgageRatioCalculatorBloc>()
              ..add(UpdateSalesPriceOfHome(formatter.getUnformattedValue())),
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

class InterestRate extends StatelessWidget {
  const InterestRate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MortgageRatioCalculatorBloc, MortgageRatioCalculatorState>(
      builder: (context, state) {
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
              labelText: "Interest Rate \%",
              suffixIcon: Icon(CupertinoIcons.percent, color: Colors.black38),
              // hintStyle: TextStyle(color: Color(0xff797CC0)),
              labelStyle: TextStyle(color: Colors.black38),

              border: InputBorder.none,
            ),
            onEditingComplete: () {
              // context.read<StaffSearchBloc>()..add(SearchStaff());
              FocusScopeNode currentFocus = FocusScope.of(context);

              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            onChanged: (value) {
              if (value != "") {
                context
                    .read<MortgageRatioCalculatorBloc>()
                    .add(UpdateInterestRate(num.parse(value)));
              }
            },
            keyboardType: TextInputType.number,
          ),
        );
      },
    );
  }
}

class TermInYears extends StatelessWidget {
  const TermInYears({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MortgageRatioCalculatorBloc, MortgageRatioCalculatorState>(
      builder: (context, state) {
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
              FocusScopeNode currentFocus = FocusScope.of(context);

              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            onChanged: (value) {
              if (value != "") {
                context
                    .read<MortgageRatioCalculatorBloc>()
                    .add(UpdateTermInYears(num.parse(value)));
              }
            },
            keyboardType: TextInputType.number,
          ),
        );
      },
    );
  }
}

class DownPaymentInPercentage extends StatelessWidget {
  const DownPaymentInPercentage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MortgageRatioCalculatorBloc, MortgageRatioCalculatorState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Down Payment",
                style: TextStyle(fontSize: 18),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(8, 4, 8, 4),
                    padding: EdgeInsets.fromLTRB(8, 18, 8, 18),
                    decoration: BoxDecoration(
                      color: Color(0xffD9DBFB),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'USD ${state.downPayment}',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}

class DownPaymentInUSD extends StatelessWidget {
  final CurrencyTextInputFormatter formatter;
  const DownPaymentInUSD({Key? key, required this.formatter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MortgageRatioCalculatorBloc, MortgageRatioCalculatorState>(
      builder: (context, state) {
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
              labelText: "Down Payment (%)",
              suffixIcon: Icon(CupertinoIcons.percent, color: Colors.black38),
              // hintStyle: TextStyle(color: Color(0xff797CC0)),
              labelStyle: TextStyle(color: Colors.black38),

              border: InputBorder.none,
            ),
            onEditingComplete: () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            onChanged: (value) {
              context.read<MortgageRatioCalculatorBloc>()..add(UpdateDownPayment(num.parse(value)));
            },
            keyboardType: TextInputType.number,
          ),
        );
      },
    );
  }
}

class YearlyTaxes extends StatelessWidget {
  final CurrencyTextInputFormatter formatter;

  const YearlyTaxes({Key? key, required this.formatter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MortgageRatioCalculatorBloc, MortgageRatioCalculatorState>(
      builder: (context, state) {
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
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            onChanged: (value) => context.read<MortgageRatioCalculatorBloc>()
              ..add(UpdateYearlyTaxes(formatter.getUnformattedValue())),
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

class YearlyInsurance extends StatelessWidget {
  final CurrencyTextInputFormatter formatter;

  const YearlyInsurance({Key? key, required this.formatter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MortgageRatioCalculatorBloc, MortgageRatioCalculatorState>(
      builder: (context, state) {
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
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            onChanged: (value) => context.read<MortgageRatioCalculatorBloc>()
              ..add(UpdateYearlyInsurance(formatter.getUnformattedValue())),
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

class MonthlyMortgageInsurance extends StatelessWidget {
  final CurrencyTextInputFormatter formatter;

  const MonthlyMortgageInsurance({Key? key, required this.formatter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MortgageRatioCalculatorBloc, MortgageRatioCalculatorState>(
      builder: (context, state) {
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
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            onChanged: (value) => context.read<MortgageRatioCalculatorBloc>()
              ..add(UpdateMonthlyMortgageInsurance(formatter.getUnformattedValue())),
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

class HOAMonthlyPayment extends StatelessWidget {
  final CurrencyTextInputFormatter formatter;

  const HOAMonthlyPayment({Key? key, required this.formatter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MortgageRatioCalculatorBloc, MortgageRatioCalculatorState>(
      builder: (context, state) {
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
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            onChanged: (value) => context.read<MortgageRatioCalculatorBloc>()
              ..add(UpdateHOAMonthlyPayment(formatter.getUnformattedValue())),
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
