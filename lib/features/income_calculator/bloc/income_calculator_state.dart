part of 'income_calculator_bloc.dart';

class IncomeCalculatorState extends Equatable {
  const IncomeCalculatorState({
    this.monthlyIncome = 0,
    this.employeeType = Strings.hourlyEmployee,
    this.incomePerHour = 0,
    this.numberOfHoursPerWeek = 0,
    this.salaryType = Strings.paidPerMonth,
    this.payPerMonth = 0,
    this.payTwicePerMonth = 0,
    this.payTwiceAWeekYouGetExtra = 0,
    this.payWeekly = 0,
  });

  final num monthlyIncome;
  final String employeeType;
  final num incomePerHour;
  final num numberOfHoursPerWeek;
  final String salaryType;
  final num payPerMonth;
  final num payTwicePerMonth;
  final num payTwiceAWeekYouGetExtra;
  final num payWeekly;

  IncomeCalculatorState copyWith({
    num? monthlyIncome,
    String? employeeType,
    num? incomePerHour,
    num? numberOfHoursPerWeek,
    String? salaryType,
    num? payPerMonth,
    num? payTwicePerMonth,
    num? payTwiceAWeekYouGetExtra,
    num? payWeekly,
  }) {
    return IncomeCalculatorState(
      monthlyIncome: monthlyIncome ?? this.monthlyIncome,
      employeeType: employeeType ?? this.employeeType,
      incomePerHour: incomePerHour ?? this.incomePerHour,
      numberOfHoursPerWeek: numberOfHoursPerWeek ?? this.numberOfHoursPerWeek,
      salaryType: salaryType ?? this.salaryType,
      payPerMonth: payPerMonth ?? this.payPerMonth,
      payTwicePerMonth: payTwicePerMonth ?? this.payTwicePerMonth,
      payTwiceAWeekYouGetExtra: payTwiceAWeekYouGetExtra ?? this.payTwiceAWeekYouGetExtra,
      payWeekly: payWeekly ?? this.payWeekly,
    );
  }

  @override
  List<Object> get props => [
        monthlyIncome,
        employeeType,
        incomePerHour,
        numberOfHoursPerWeek,
        salaryType,
        payPerMonth,
        payTwicePerMonth,
        payTwiceAWeekYouGetExtra,
        payWeekly
      ];
}
