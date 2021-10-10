import 'package:dti_calculator/di/components/service_locator.dart';
import 'package:dti_calculator/features/debt_calculator/bloc/debt_calculator_bloc.dart';
import 'package:dti_calculator/features/income_calculator/bloc/income_calculator_bloc.dart';
import 'package:dti_calculator/features/mortgage_ratio_calculator/student_loan/bloc/student_loan_bloc.dart';
import 'package:dti_calculator/routing/navigation_service.dart';
import 'package:dti_calculator/routing/page_route_constants.dart';
import 'package:dti_calculator/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/app_bloc.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppBloc>(
          create: (context) {
            return AppBloc(getOnBoardingCompletedUseCase: getIt())..add(GetAppState());
          },
        ),
        BlocProvider<IncomeCalculatorBloc>(
          create: (context) {
            return IncomeCalculatorBloc();
          },
        ),
        BlocProvider<StudentLoanBloc>(
          create: (context) {
            return StudentLoanBloc();
          },
        ),
        BlocProvider<DebtCalculatorBloc>(
          create: (context) {
            return DebtCalculatorBloc();
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: getIt<NavigationService>().navigatorKey,
        title: 'DTI Calculator',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        builder: (context, child) {
          return BlocListener<AppBloc, AppState>(
            listener: (context, state) {
              switch (state.showDisclaimer) {
                case true:
                  getIt<NavigationService>().navigateAndRemove(PageRouteConstants.disclaimerScreen);
                  break;

                case false:
                  getIt<NavigationService>()
                      .navigateAndRemove(PageRouteConstants.incomeCalculatorScreen);
                  break;

                default:
                  break;
              }
            },
            child: child,
          );
        },
        onGenerateRoute: ScreenRouter.generateRoute,
        home: Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
