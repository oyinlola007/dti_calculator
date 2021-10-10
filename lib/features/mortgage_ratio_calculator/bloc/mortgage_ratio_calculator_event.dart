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

class UpdateYearlyInsurance extends MortgageRatioCalculatorEvent {
  final num yearlyInsurance;

  const UpdateYearlyInsurance(this.yearlyInsurance);

  @override
  List<Object> get props => [yearlyInsurance];
}

class UpdateMonthlyMortgageInsurance extends MortgageRatioCalculatorEvent {
  final num monthlyMortgageInsurance;

  const UpdateMonthlyMortgageInsurance(this.monthlyMortgageInsurance);

  @override
  List<Object> get props => [monthlyMortgageInsurance];
}

class UpdateHOAMonthlyPayment extends MortgageRatioCalculatorEvent {
  final num hOAMonthlyPayment;

  const UpdateHOAMonthlyPayment(this.hOAMonthlyPayment);

  @override
  List<Object> get props => [hOAMonthlyPayment];
}

class ShowResult extends MortgageRatioCalculatorEvent {}

class Reset extends MortgageRatioCalculatorEvent {}
