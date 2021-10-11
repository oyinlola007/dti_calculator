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

    if (event is UpdateHomeOwnerInsurance) {
      yield* _mapUpdateYearlyInsuranceEventToState(event);
    }

    if (event is UpdateMortgageInsurance) {
      yield* _mapUpdateMonthlyMortgageInsuranceEventToState(event);
    }

    if (event is UpdateHOAMonthlyPayment) {
      yield* _mapUpdateHOAMonthlyPaymentEventToState(event);
    }

    if (event is ShowResult) {
      yield* _mapShowResultEventToState(event);
    }

    if (event is ClearMortgageRatioCalculator) {
      yield* _mapClearMortgageRatioCalculatorEventToState();
    }
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
    yield state.copyWith(interestRate: iR);
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
      UpdateHomeOwnerInsurance event) async* {
    yield state.copyWith(homeOwnerInsurance: event.homeOwnerInsurance);
  }

  Stream<MortgageRatioCalculatorState> _mapUpdateMonthlyMortgageInsuranceEventToState(
      UpdateMortgageInsurance event) async* {
    yield state.copyWith(mortgageInsurance: event.mortgageInsurance);
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
    // monthlyPayment = -((pv * (apr / 12) * complexity) / complexity - 1);
    monthlyPayment = ((pv * (apr / 12) * complexity) / (complexity - 1));

    // print(Finance.pmt(rate: 0.025 / 12, nper: 10 * 12, pv: 100000));

    // monthlyPayment = 951;

    num totalMonthlyMortgagePayment = monthlyPayment +
        (state.yearlyTaxes / 12) +
        (state.homeOwnerInsurance / 12) +
        (state.mortgageInsurance) +
        (state.hOAMonthlyPayment);

    num fER = (totalMonthlyMortgagePayment / state.monthlyIncome) * 100;
    num bER =
        ((totalMonthlyMortgagePayment + state.totalDebt + state.loanAmount) / state.monthlyIncome) *
            100;

    yield state.copyWith(
        monthlyPayment: monthlyPayment,
        frontEndRatio: fER,
        backEndRatio: bER,
        totalMortgagePayment: double.parse((totalMonthlyMortgagePayment).toStringAsFixed(2)));

    print("===>totalMonthlyMortgagePayment $totalMonthlyMortgagePayment");
    print("===>monthlyPayment $monthlyPayment");

    print("===>interestRate ${state.interestRate}");

    print("===>yearlyTaxes ${state.yearlyTaxes}");
    print("===>homeOwnerInsurance ${state.homeOwnerInsurance}");
    print("===>mortgageInsurance ${state.mortgageInsurance}");

    print("===>fER $fER");
    print("===>bER $bER");
  }

  Stream<MortgageRatioCalculatorState> _mapClearMortgageRatioCalculatorEventToState() async* {
    yield state.copyWith(
      salesPriceOfHome: 0,
      interestRate: 0,
      termInYears: 0,
      downPaymentInPercentage: 0,
      downPayment: 0,
      yearlyTaxes: 0,
      homeOwnerInsurance: 0,
      mortgageInsurance: 0,
      hOAMonthlyPayment: 0,
      totalMortgagePayment: 0,
      monthlyPayment: 0,
      frontEndRatio: 0,
      backEndRatio: 0,
    );
  }
}
