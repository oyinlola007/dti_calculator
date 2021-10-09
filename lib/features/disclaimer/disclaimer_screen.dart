import 'package:dti_calculator/di/components/service_locator.dart';
import 'package:dti_calculator/features/disclaimer/presentation/cubit/on_boarding_cubit.dart';
import 'package:dti_calculator/features/income_calculator/income_calculator_screen.dart';
import 'package:dti_calculator/res/colors.dart';
import 'package:dti_calculator/res/strings.dart';
import 'package:dti_calculator/routing/navigation_service.dart';
import 'package:dti_calculator/routing/page_route_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DisclaimerScreen extends StatefulWidget {
  const DisclaimerScreen({Key? key}) : super(key: key);

  @override
  _DisclaimerScreenState createState() => _DisclaimerScreenState();
}

class _DisclaimerScreenState extends State<DisclaimerScreen> {
  bool acceptDisclaimer = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => OnBoardingCubit(getIt()),
      child: Scaffold(
        appBar: AppBar(
          title: Text("DISCLAIMER"),
          centerTitle: true,
          // backgroundColor: AppColors.primaryColor,
        ),
        body: BlocListener<OnBoardingCubit, OnBoardingState>(
          listener: (context, state) {
            if (state is OnBoardingCompleted) {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => IncomeCalculatorScreen()),
              // );
              getIt<NavigationService>()
                  .navigateAndRemove(PageRouteConstants.incomeCalculatorScreen);
            }
          },
          child: SingleChildScrollView(
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
                          'I Understand',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      value: acceptDisclaimer,
                      onChanged: (bool? value) {
                        setState(() {
                          acceptDisclaimer = value!;
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
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: BlocBuilder<OnBoardingCubit, OnBoardingState>(
                            builder: (c, state) {
                              return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20))),
                                child: Text(
                                  'Continue',
                                  style: TextStyle(fontSize: 20),
                                ),
                                onPressed: () {
                                  if (acceptDisclaimer) {
                                    c.read<OnBoardingCubit>().completeOnBoarding();
                                  } else {
                                    getIt<NavigationService>().navigateAndRemove(
                                        PageRouteConstants.incomeCalculatorScreen);
                                  }
                                },
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DisclaimerButton extends StatelessWidget {
  const DisclaimerButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
