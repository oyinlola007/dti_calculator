import 'package:flutter/material.dart';

class HourlyEmployeeWidget extends StatefulWidget {
  const HourlyEmployeeWidget({Key? key}) : super(key: key);

  @override
  _HourlyEmployeeWidgetState createState() => _HourlyEmployeeWidgetState();
}

class _HourlyEmployeeWidgetState extends State<HourlyEmployeeWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
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
            child: TextField(
              style: TextStyle(
                color: Color(0xff797CC0),
                fontSize: 18,
              ),
              decoration: InputDecoration(
                hintText: "Income per hour",
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

              // inputFormatters: <TextInputFormatter>[
              //   _formatter,
              // ],
              keyboardType: TextInputType.number,
            ),
          ),
          SizedBox(
            height: 8,
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
                hintText: "Number of hours per week",
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
              keyboardType: TextInputType.number,
            ),
          ),
          SizedBox(
            height: 22,
          ),
        ],
      ),
    );
  }
}
