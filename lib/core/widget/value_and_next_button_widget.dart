import 'package:flutter/material.dart';

class MonthlyIncomeValueWidget extends StatefulWidget {
  final String title;
  final String value;
  final Function onPressAction;
  const MonthlyIncomeValueWidget(
      {Key? key, required this.title, required this.value, required this.onPressAction})
      : super(key: key);

  @override
  _MonthlyIncomeValueWidgetState createState() => _MonthlyIncomeValueWidgetState();
}

class _MonthlyIncomeValueWidgetState extends State<MonthlyIncomeValueWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 22,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.title,
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
                  widget.value,
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                  child: Text(
                    'Next',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    widget.onPressAction();
                  },
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
