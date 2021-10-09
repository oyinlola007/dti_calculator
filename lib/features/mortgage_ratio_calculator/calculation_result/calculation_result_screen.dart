import 'package:dti_calculator/features/mortgage_ratio_calculator/calculation_result/widget/calculation_result_item_widget.dart';
import 'package:flutter/material.dart';

class CalculationResultScreen extends StatefulWidget {
  const CalculationResultScreen({Key? key}) : super(key: key);

  @override
  _CalculationResultScreenState createState() => _CalculationResultScreenState();
}

class _CalculationResultScreenState extends State<CalculationResultScreen> {
  @override
  Widget build(BuildContext context) {
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
              title: 'Total Mortgage Payment',
              value: "USD 1,000",
            ),
            CalculationResultItemWidget(
              title: 'Principal + Interest only Payment',
              value: "USD 2,000",
            ),
            CalculationResultItemWidget(
              title: 'Front End Ratio',
              value: "36%",
            ),
            CalculationResultItemWidget(
              title: 'Back End Ratio',
              value: "51%",
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                child: Text(
                  'Done',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
