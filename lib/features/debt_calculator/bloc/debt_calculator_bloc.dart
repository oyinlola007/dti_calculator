import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dti_calculator/res/strings.dart';
import 'package:equatable/equatable.dart';

part 'debt_calculator_event.dart';
part 'debt_calculator_state.dart';

class DebtCalculatorBloc extends Bloc<DebtCalculatorEvent, DebtCalculatorState> {
  DebtCalculatorBloc() : super(DebtCalculatorState());

  @override
  Stream<DebtCalculatorState> mapEventToState(DebtCalculatorEvent event) async* {
    if (event is UpdateEmployeeType) {
      yield* _mapUpdateEmployeeTypeEventToState(event);
    }

    if (event is UpdateSalaryType) {
      yield* _mapUpdateSalaryTypeEventToState(event);
    }
  }

  Stream<DebtCalculatorState> _mapUpdateEmployeeTypeEventToState(UpdateEmployeeType event) async* {}

  Stream<DebtCalculatorState> _mapUpdateSalaryTypeEventToState(UpdateSalaryType event) async* {}
}
