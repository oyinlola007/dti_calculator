part of 'mortgage_ratio_calculator_bloc.dart';

class MortgageRatioCalculatorState extends Equatable {
  MortgageRatioCalculatorState({
    this.showResult = false,
    this.monthlyIncome = 0,
    this.loanAmount = 0,
    this.totalDebt = 0,
    this.salesPriceOfHome = 0,
    this.interestRate = 0,
    this.termInYears = 0,
    this.downPaymentInPercentage = 0,
    this.downPayment = 0,
    this.yearlyTaxes = 0,
    this.homeOwnerInsurance = 0,
    this.mortgageInsurance = 0,
    this.hOAMonthlyPayment = 0,
    this.totalMortgagePayment = 0,
    this.monthlyPayment = 0,
    this.frontEndRatio = 0,
    this.backEndRatio = 0,
  });

  final bool showResult;

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
  final num homeOwnerInsurance;
  final num mortgageInsurance;
  final num hOAMonthlyPayment;

  // Result
  final num totalMortgagePayment;
  final num monthlyPayment;
  final num frontEndRatio;
  final num backEndRatio;

  MortgageRatioCalculatorState copyWith({
    bool? showResult,
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
    num? homeOwnerInsurance,
    num? mortgageInsurance,
    num? hOAMonthlyPayment,
    // Result
    num? totalMortgagePayment,
    num? monthlyPayment,
    num? frontEndRatio,
    num? backEndRatio,
  }) {
    return MortgageRatioCalculatorState(
      showResult: showResult ?? this.showResult,
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
      homeOwnerInsurance: homeOwnerInsurance ?? this.homeOwnerInsurance,
      mortgageInsurance: mortgageInsurance ?? this.mortgageInsurance,
      hOAMonthlyPayment: hOAMonthlyPayment ?? this.hOAMonthlyPayment,
      // Result

      totalMortgagePayment: totalMortgagePayment ?? this.totalMortgagePayment,
      monthlyPayment: monthlyPayment ?? this.monthlyPayment,
      frontEndRatio: frontEndRatio ?? this.frontEndRatio,
      backEndRatio: backEndRatio ?? this.backEndRatio,
    );
  }

  @override
  List<Object> get props => [
        showResult,
        monthlyIncome,
        loanAmount,
        totalDebt,
        salesPriceOfHome,
        interestRate,
        termInYears,
        downPaymentInPercentage,
        downPayment,
        yearlyTaxes,
        homeOwnerInsurance,
        mortgageInsurance,
        hOAMonthlyPayment,
        totalMortgagePayment,
        monthlyPayment,
        frontEndRatio,
        backEndRatio
      ];
}
