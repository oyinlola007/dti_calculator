import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dti_calculator/res/strings.dart';
import 'package:equatable/equatable.dart';

part 'mortgage_ratio_calculator_event.dart';
part 'mortgage_ratio_calculator_state.dart';

class MortgageRatioCalculatorBloc
    extends Bloc<MortgageRatioCalculatorEvent, MortgageRatioCalculatorState> {
  MortgageRatioCalculatorBloc() : super(MortgageRatioCalculatorState());

  @override
  Stream<MortgageRatioCalculatorState> mapEventToState(MortgageRatioCalculatorEvent event) async* {
    if (event is UpdateEmployeeType) {
      yield* _mapUpdateEmployeeTypeEventToState(event);
    }

    if (event is UpdateSalaryType) {
      yield* _mapUpdateSalaryTypeEventToState(event);
    }

    // if (event is Reset) {
    //   yield* _mapResetEventToState();
    // }
  }

  Stream<MortgageRatioCalculatorState> _mapUpdateEmployeeTypeEventToState(
      UpdateEmployeeType event) async* {}

  Stream<MortgageRatioCalculatorState> _mapUpdateSalaryTypeEventToState(
      UpdateSalaryType event) async* {}

// Stream<MortgageRatioCalculatorState> _mapResetEventToState() async* {
//   // Todo Confirm if this works
//   // Note do not reset on page destroy
//   yield MortgageRatioCalculatorState();
// }
}
