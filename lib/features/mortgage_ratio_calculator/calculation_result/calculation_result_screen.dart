import 'package:dti_calculator/features/mortgage_ratio_calculator/bloc/mortgage_ratio_calculator_bloc.dart';
import 'package:dti_calculator/features/mortgage_ratio_calculator/calculation_result/widget/calculation_result_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CalculationResultScreen extends StatelessWidget {
  const CalculationResultScreen({
    Key? key,
    // required this.totalMortgagePayment,
    // required this.frontEndRatio,
    // required this.backEndRatio,
  }) : super(key: key);

  // final num totalMortgagePayment;
  //
  // // final num principalInterestOnlyPayment;
  // final num frontEndRatio;
  // final num backEndRatio;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MortgageRatioCalculatorBloc, MortgageRatioCalculatorState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Result"),
            centerTitle: true,
            // backgroundColor: AppColors.primaryColor,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                CalculationResultItemWidget(
                  title: 'Total Monthly Mortgage Payment',
                  value: NumberFormat.currency(name: 'USD ').format(state.totalMortgagePayment),
                ),
                CalculationResultItemWidget(
                  title: 'Monthly Payment',
                  value: NumberFormat.currency(name: 'USD ').format(state.monthlyPayment),
                ),
                CalculationResultItemWidget(
                  title: 'Front End Ratio',
                  value: "${double.parse((state.frontEndRatio).toStringAsFixed(2))}%",
                ),
                CalculationResultItemWidget(
                  title: 'Back End Ratio',
                  value: "${double.parse((state.backEndRatio).toStringAsFixed(2))}%",
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8),
                //   child: ElevatedButton(
                //     style: ElevatedButton.styleFrom(
                //         padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                //     child: Text(
                //       'Done',
                //       style: TextStyle(fontSize: 20),
                //     ),
                //     onPressed: () {},
                //   ),
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}
