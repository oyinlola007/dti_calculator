part of 'mortgage_ratio_calculator_bloc.dart';

abstract class MortgageRatioCalculatorEvent extends Equatable {
  const MortgageRatioCalculatorEvent();
  @override
  List<Object> get props => [];
}

class UpdateIncomeLoanAndDebt extends MortgageRatioCalculatorEvent {
  final num monthlyIncome;
  final num loanAmount;
  final num totalDebt;

  UpdateIncomeLoanAndDebt(
      {required this.monthlyIncome, required this.loanAmount, required this.totalDebt});

  @override
  List<Object> get props => [monthlyIncome, loanAmount, totalDebt];
}

class UpdateSalesPriceOfHome extends MortgageRatioCalculatorEvent {
  final num salesPriceOfHome;

  const UpdateSalesPriceOfHome(this.salesPriceOfHome);

  @override
  List<Object> get props => [salesPriceOfHome];
}

class UpdateInterestRate extends MortgageRatioCalculatorEvent {
  final num interestRate;

  const UpdateInterestRate(this.interestRate);

  @override
  List<Object> get props => [interestRate];
}

class UpdateTermInYears extends MortgageRatioCalculatorEvent {
  final num termInYears;

  const UpdateTermInYears(this.termInYears);

  @override
  List<Object> get props => [termInYears];
}

class UpdateDownPayment extends MortgageRatioCalculatorEvent {
  final num downPayment;

  const UpdateDownPayment(this.downPayment);

  @override
  List<Object> get props => [downPayment];
}

class UpdateYearlyTaxes extends MortgageRatioCalculatorEvent {
  final num yearlyTaxes;

  const UpdateYearlyTaxes(this.yearlyTaxes);

  @override
  List<Object> get props => [yearlyTaxes];
}

class UpdateHomeOwnerInsurance extends MortgageRatioCalculatorEvent {
  final num homeOwnerInsurance;

  const UpdateHomeOwnerInsurance(this.homeOwnerInsurance);

  @override
  List<Object> get props => [homeOwnerInsurance];
}

class UpdateMortgageInsurance extends MortgageRatioCalculatorEvent {
  final num mortgageInsurance;

  const UpdateMortgageInsurance(this.mortgageInsurance);

  @override
  List<Object> get props => [mortgageInsurance];
}

class UpdateHOAMonthlyPayment extends MortgageRatioCalculatorEvent {
  final num hOAMonthlyPayment;

  const UpdateHOAMonthlyPayment(this.hOAMonthlyPayment);

  @override
  List<Object> get props => [hOAMonthlyPayment];
}

class ShowResult extends MortgageRatioCalculatorEvent {}

class ClearMortgageRatioCalculator extends MortgageRatioCalculatorEvent {}
