part of 'mortgage_ratio_calculator_bloc.dart';

class MortgageRatioCalculatorState extends Equatable {
  MortgageRatioCalculatorState({
    this.monthlyIncome = 0,
    this.loanAmount = 0,
    this.totalDebt = 0,
    this.salesPriceOfHome = 0,
    this.interestRate = 0,
    this.termInYears = 0,
    this.downPaymentInPercentage = 0,
    this.downPayment = 0,
    this.yearlyTaxes = 0,
    this.yearlyInsurance = 0,
    this.monthlyMortgageInsurance = 0,
    this.hOAMonthlyPayment = 0,
    this.totalMortgagePayment = 0,
    this.principalInterestOnlyPayment = 0,
    this.frontEndRatio = 0,
    this.backEndRatio = 0,
  });

  // INCOME
  final num monthlyIncome;

  // LOAN
  final num loanAmount;

  // DEBT
  final num totalDebt;

  // OTHER CALCULATION
  final num salesPriceOfHome;
  final num interestRate;
  final num termInYears;
  final num downPaymentInPercentage;
  final num downPayment;

  final num yearlyTaxes;
  final num yearlyInsurance;
  final num monthlyMortgageInsurance;
  final num hOAMonthlyPayment;

  // Result
  final num totalMortgagePayment;
  final num principalInterestOnlyPayment;
  final num frontEndRatio;
  final num backEndRatio;

  MortgageRatioCalculatorState copyWith({
    // INCOME
    num? monthlyIncome,
    // LOAN
    num? loanAmount,
    // DEBT
    num? totalDebt,
    // OTHER CALCULATION
    num? salesPriceOfHome,
    num? interestRate,
    num? termInYears,
    num? downPaymentInPercentage,
    num? downPayment,
    num? yearlyTaxes,
    num? yearlyInsurance,
    num? monthlyMortgageInsurance,
    num? hOAMonthlyPayment,
    // Result
    num? totalMortgagePayment,
    num? principalInterestOnlyPayment,
    num? frontEndRatio,
    num? backEndRatio,
  }) {
    return MortgageRatioCalculatorState(
      monthlyIncome: monthlyIncome ?? this.monthlyIncome,
      // LOAN

      loanAmount: loanAmount ?? this.loanAmount,
      // DEBT

      totalDebt: totalDebt ?? this.totalDebt,
      salesPriceOfHome: salesPriceOfHome ?? this.salesPriceOfHome,
      // OTHER CALCULATION

      interestRate: interestRate ?? this.interestRate,
      termInYears: termInYears ?? this.termInYears,
      downPaymentInPercentage: downPaymentInPercentage ?? this.downPaymentInPercentage,
      downPayment: downPayment ?? this.downPayment,
      yearlyTaxes: yearlyTaxes ?? this.yearlyTaxes,
      yearlyInsurance: yearlyInsurance ?? this.yearlyInsurance,
      monthlyMortgageInsurance: monthlyMortgageInsurance ?? this.monthlyMortgageInsurance,
      hOAMonthlyPayment: hOAMonthlyPayment ?? this.hOAMonthlyPayment,
      // Result

      totalMortgagePayment: totalMortgagePayment ?? this.totalMortgagePayment,
      principalInterestOnlyPayment:
          principalInterestOnlyPayment ?? this.principalInterestOnlyPayment,
      frontEndRatio: frontEndRatio ?? this.frontEndRatio,
      backEndRatio: backEndRatio ?? this.backEndRatio,
    );
  }

  @override
  List<Object> get props => [
        monthlyIncome,
        loanAmount,
        totalDebt,
        salesPriceOfHome,
        interestRate,
        termInYears,
        downPaymentInPercentage,
        downPayment,
        yearlyTaxes,
        yearlyInsurance,
        monthlyMortgageInsurance,
        hOAMonthlyPayment,
        totalMortgagePayment,
        principalInterestOnlyPayment,
        frontEndRatio,
        backEndRatio
      ];
}
