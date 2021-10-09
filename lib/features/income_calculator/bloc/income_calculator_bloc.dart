import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dti_calculator/res/strings.dart';
import 'package:equatable/equatable.dart';

part 'income_calculator_event.dart';
part 'income_calculator_state.dart';

class IncomeCalculatorBloc extends Bloc<IncomeCalculatorEvent, IncomeCalculatorState> {
  IncomeCalculatorBloc() : super(IncomeCalculatorState());

  @override
  Stream<IncomeCalculatorState> mapEventToState(IncomeCalculatorEvent event) async* {
    if (event is UpdateEmployeeType) {
      yield* _mapUpdateEmployeeTypeEventToState(event);
    }

    if (event is UpdateSalaryType) {
      yield* _mapUpdateSalaryTypeEventToState(event);
    }

    if (event is UpdateIncomePerHour) {
      yield* _mapUpdateIncomePerHourEventToState(event);
    }

    if (event is UpdateNumberOfHoursPerWeek) {
      yield* _mapUpdateNumberOfHoursPerWeekEventToState(event);
    }

    if (event is UpdatePayPerMonth) {
      yield* _mapUpdatePayPerMonthEventToState(event);
    }

    if (event is UpdatePayTwicePerMonth) {
      yield* _mapUpdatePayTwicePerMonthEventToState(event);
    }

    if (event is UpdatePayTwiceAWeekYouGetExtra) {
      yield* _mapUpdatePayTwiceAWeekYouGetExtraEventToState(event);
    }

    if (event is UpdatePayWeekly) {
      yield* _mapUpdatePayWeeklyEventToState(event);
    }

    // if (event is Reset) {
    //   yield* _mapResetEventToState();
    // }
  }

  Stream<IncomeCalculatorState> _mapUpdateEmployeeTypeEventToState(
      UpdateEmployeeType event) async* {
    yield state.copyWith(employeeType: event.employeeType);
  }

  Stream<IncomeCalculatorState> _mapUpdateSalaryTypeEventToState(UpdateSalaryType event) async* {
    yield state.copyWith(salaryType: event.salaryType);
  }

  Stream<IncomeCalculatorState> _mapUpdateIncomePerHourEventToState(
      UpdateIncomePerHour event) async* {
    yield state.copyWith(incomePerHour: event.incomePerHour);
    if (event.incomePerHour != 0) {
      yield state.copyWith(monthlyIncome: 0);
      if (state.numberOfHoursPerWeek != 0) {
        var incomePerMonth = (event.incomePerHour * state.incomePerHour);
        yield state.copyWith(monthlyIncome: incomePerMonth);
      }
    }
  }

  Stream<IncomeCalculatorState> _mapUpdateNumberOfHoursPerWeekEventToState(
      UpdateNumberOfHoursPerWeek event) async* {
    yield state.copyWith(numberOfHoursPerWeek: event.numberOfHoursPerWeek);
    if (state.incomePerHour != 0) {
      yield state.copyWith(monthlyIncome: 0);
      if (event.numberOfHoursPerWeek != 0) {
        var incomePerMonth = (event.numberOfHoursPerWeek * state.incomePerHour);
        yield state.copyWith(monthlyIncome: incomePerMonth);
      }
    }
  }

  Stream<IncomeCalculatorState> _mapUpdatePayPerMonthEventToState(UpdatePayPerMonth event) async* {
    yield state.copyWith(payPerMonth: event.payPerMonth);
    if (event.payPerMonth != 0) {
      var incomePerMonth = event.payPerMonth;
      yield state.copyWith(monthlyIncome: incomePerMonth);
    }
  }

  Stream<IncomeCalculatorState> _mapUpdatePayTwicePerMonthEventToState(
      UpdatePayTwicePerMonth event) async* {
    yield state.copyWith(payTwicePerMonth: event.payTwicePerMonth);

    if (event.payTwicePerMonth != 0) {
      var incomePerMonth = (event.payTwicePerMonth * 24) / 12;
      yield state.copyWith(monthlyIncome: incomePerMonth);
    }
  }

  Stream<IncomeCalculatorState> _mapUpdatePayTwiceAWeekYouGetExtraEventToState(
      UpdatePayTwiceAWeekYouGetExtra event) async* {
    yield state.copyWith(payTwiceAWeekYouGetExtra: event.payTwiceAWeekYouGetExtra);
    if (event.payTwiceAWeekYouGetExtra != 0) {
      var incomePerMonth = (event.payTwiceAWeekYouGetExtra * 26) / 12;
      yield state.copyWith(monthlyIncome: incomePerMonth);
    }
  }

  Stream<IncomeCalculatorState> _mapUpdatePayWeeklyEventToState(UpdatePayWeekly event) async* {
    yield state.copyWith(payWeekly: event.payWeekly);
    if (event.payWeekly != 0) {
      var incomePerMonth = (event.payWeekly * 52) / 12;
      yield state.copyWith(monthlyIncome: incomePerMonth);
    }
  }

  // Stream<IncomeCalculatorState> _mapResetEventToState() async* {
  //   // Todo Confirm if this works
  //   // Note do not reset on page destroy
  //   yield IncomeCalculatorState();
  // }
}
