import 'dart:async';
import 'dart:math';

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
    if (event is UpdateIncomeLoanAndDebt) {
      yield* _mapUpdateIncomeLoanAndDebtEventToState(event);
    }

    if (event is UpdateSalesPriceOfHome) {
      yield* _mapUpdateSalesPriceOfHomeEventToState(event);
    }

    if (event is UpdateInterestRate) {
      yield* _mapUpdateInterestRateEventToState(event);
    }

    if (event is UpdateTermInYears) {
      yield* _mapUpdateTermInYearsEventToState(event);
    }

    if (event is UpdateDownPayment) {
      yield* _mapUpdateDownPaymentEventToState(event);
    }

    if (event is UpdateYearlyTaxes) {
      yield* _mapUpdateYearlyTaxesEventToState(event);
    }

    if (event is UpdateYearlyInsurance) {
      yield* _mapUpdateYearlyInsuranceEventToState(event);
    }

    if (event is UpdateMonthlyMortgageInsurance) {
      yield* _mapUpdateMonthlyMortgageInsuranceEventToState(event);
    }

    if (event is UpdateHOAMonthlyPayment) {
      yield* _mapUpdateHOAMonthlyPaymentEventToState(event);
    }

    if (event is ShowResult) {
      yield* _mapShowResultEventToState(event);
    }

    // if (event is Reset) {
    //   yield* _mapResetEventToState();
    // }
  }

  Stream<MortgageRatioCalculatorState> _mapUpdateIncomeLoanAndDebtEventToState(
      UpdateIncomeLoanAndDebt event) async* {
    yield state.copyWith(
      monthlyIncome: event.monthlyIncome,
      loanAmount: event.loanAmount,
      totalDebt: event.totalDebt,
    );
  }

  Stream<MortgageRatioCalculatorState> _mapUpdateSalesPriceOfHomeEventToState(
      UpdateSalesPriceOfHome event) async* {
    yield state.copyWith(salesPriceOfHome: event.salesPriceOfHome);
  }

  Stream<MortgageRatioCalculatorState> _mapUpdateInterestRateEventToState(
      UpdateInterestRate event) async* {
    num iR = event.interestRate / 100;
    yield state.copyWith(termInYears: iR);
  }

  Stream<MortgageRatioCalculatorState> _mapUpdateTermInYearsEventToState(
      UpdateTermInYears event) async* {
    yield state.copyWith(termInYears: event.termInYears);
  }

  Stream<MortgageRatioCalculatorState> _mapUpdateDownPaymentEventToState(
      UpdateDownPayment event) async* {
    num downPaymentInUsd = 0;
    if (state.salesPriceOfHome != 0) {
      downPaymentInUsd = state.salesPriceOfHome * (event.downPayment / 100);
    }
    yield state.copyWith(downPaymentInPercentage: event.downPayment, downPayment: downPaymentInUsd);
  }

  Stream<MortgageRatioCalculatorState> _mapUpdateYearlyTaxesEventToState(
      UpdateYearlyTaxes event) async* {
    yield state.copyWith(yearlyTaxes: event.yearlyTaxes);
  }

  Stream<MortgageRatioCalculatorState> _mapUpdateYearlyInsuranceEventToState(
      UpdateYearlyInsurance event) async* {
    yield state.copyWith(yearlyInsurance: event.yearlyInsurance);
  }

  Stream<MortgageRatioCalculatorState> _mapUpdateMonthlyMortgageInsuranceEventToState(
      UpdateMonthlyMortgageInsurance event) async* {
    yield state.copyWith(monthlyMortgageInsurance: event.monthlyMortgageInsurance);
  }

  Stream<MortgageRatioCalculatorState> _mapUpdateHOAMonthlyPaymentEventToState(
      UpdateHOAMonthlyPayment event) async* {
    yield state.copyWith(hOAMonthlyPayment: event.hOAMonthlyPayment);
  }

  Stream<MortgageRatioCalculatorState> _mapShowResultEventToState(ShowResult event) async* {
    num monthlyPayment = 0;
    num pv = state.salesPriceOfHome - state.downPayment;
    num nper = state.termInYears;
    num apr = state.interestRate;

    //

    num onePlusAprDiv12 = (1 + (apr / 12));
    var complexity = pow(onePlusAprDiv12, (nper * 12));
    monthlyPayment = -((pv * (apr / 12) * complexity) / complexity - 1);

    num totalMonthlyMortgagePayment = monthlyPayment +
        (state.yearlyTaxes / 12) +
        (state.monthlyMortgageInsurance) +
        (state.hOAMonthlyPayment);

    num fER = (totalMonthlyMortgagePayment / state.monthlyIncome) * 100;
    num bER =
        ((totalMonthlyMortgagePayment + state.totalDebt + state.loanAmount) / state.monthlyIncome) *
            100;

    yield state.copyWith(
        frontEndRatio: double.parse((fER).toStringAsFixed(6)),
        backEndRatio: double.parse((bER).toStringAsFixed(6)),
        totalMortgagePayment: double.parse((totalMonthlyMortgagePayment).toStringAsFixed(2)));

    print("===>monthlyPayment $monthlyPayment");
    print("===>fER $fER");
    print("===>bER $bER");
  }

// Stream<MortgageRatioCalculatorState> _mapResetEventToState() async* {
//   // Todo Confirm if this works
//   // Note do not reset on page destroy
//   yield MortgageRatioCalculatorState();
// }
}
