import 'package:flutter/material.dart';

class DropdownButtonWidget extends StatelessWidget {
  final List<String> types;
  final String value;
  final Function action;

  DropdownButtonWidget(this.value, this.action, this.types);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
      padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Color(0xffD9DBFB),
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        isDense: false,
        value: value,
        icon: Icon(Icons.arrow_drop_down, color: Color(0xff797CC0)),
        iconSize: 18,
        elevation: 16,
        style: TextStyle(fontSize: 16, color: Color(0xff797CC0)),
        underline: Container(
          height: 1,
          color: Colors.transparent,
        ),
        onChanged: (value) {
          action(value);
        },
        items: types.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
