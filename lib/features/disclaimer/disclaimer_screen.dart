import 'package:dti_calculator/res/colors.dart';
import 'package:dti_calculator/res/strings.dart';
import 'package:flutter/material.dart';

class DisclaimerScreen extends StatefulWidget {
  const DisclaimerScreen({Key? key}) : super(key: key);

  @override
  _DisclaimerScreenState createState() => _DisclaimerScreenState();
}

class _DisclaimerScreenState extends State<DisclaimerScreen> {
  bool _twoWayTicket = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DISCLAIMER"),
        centerTitle: true,
        // backgroundColor: AppColors.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  Strings.disclaimer,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                // color: Colors.deepPurple,
                child: CheckboxListTile(
                  contentPadding: EdgeInsets.all(0),

                  title: Padding(
                    padding: EdgeInsets.all(0),
                    child: Text(
                      'I AGREE',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  value: _twoWayTicket,
                  onChanged: (bool? value) {
                    setState(() {
                      _twoWayTicket = value!;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: AppColors.primaryColor,
                  // secondary: const Icon(Icons.hourglass_empty),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      color: Colors.deepPurple,
                      onPressed: () {},
                      child: Text(
                        "Continue",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
