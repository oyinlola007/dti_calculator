import 'package:flutter/material.dart';

class CalculationResultItemWidget extends StatefulWidget {
  final String title;
  final String value;
  const CalculationResultItemWidget({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  _CalculationResultItemWidgetState createState() => _CalculationResultItemWidgetState();
}

class _CalculationResultItemWidgetState extends State<CalculationResultItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
          height: 8,
        ),
      ],
    );
  }
}
