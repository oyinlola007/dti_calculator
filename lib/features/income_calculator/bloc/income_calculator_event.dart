part of 'income_calculator_bloc.dart';

abstract class IncomeCalculatorEvent extends Equatable {
  const IncomeCalculatorEvent();
  @override
  List<Object> get props => [];
}

class UpdateEmployeeType extends IncomeCalculatorEvent {
  final String employeeType;

  const UpdateEmployeeType(this.employeeType);

  @override
  List<Object> get props => [employeeType];
}

class UpdateSalaryType extends IncomeCalculatorEvent {
  final String salaryType;

  const UpdateSalaryType(this.salaryType);

  @override
  List<Object> get props => [salaryType];
}

class UpdateIncomePerHour extends IncomeCalculatorEvent {
  final num incomePerHour;

  const UpdateIncomePerHour(this.incomePerHour);

  @override
  List<Object> get props => [incomePerHour];
}

class UpdateNumberOfHoursPerWeek extends IncomeCalculatorEvent {
  final num numberOfHoursPerWeek;

  const UpdateNumberOfHoursPerWeek(this.numberOfHoursPerWeek);

  @override
  List<Object> get props => [numberOfHoursPerWeek];
}

class UpdatePayPerMonth extends IncomeCalculatorEvent {
  final num payPerMonth;

  const UpdatePayPerMonth(this.payPerMonth);

  @override
  List<Object> get props => [payPerMonth];
}

class UpdatePayTwicePerMonth extends IncomeCalculatorEvent {
  final num payTwicePerMonth;

  const UpdatePayTwicePerMonth(this.payTwicePerMonth);

  @override
  List<Object> get props => [payTwicePerMonth];
}

class UpdatePayTwiceAWeekYouGetExtra extends IncomeCalculatorEvent {
  final num payTwiceAWeekYouGetExtra;

  const UpdatePayTwiceAWeekYouGetExtra(this.payTwiceAWeekYouGetExtra);

  @override
  List<Object> get props => [payTwiceAWeekYouGetExtra];
}

class UpdatePayWeekly extends IncomeCalculatorEvent {
  final num payWeekly;

  const UpdatePayWeekly(this.payWeekly);

  @override
  List<Object> get props => [payWeekly];
}

class Reset extends IncomeCalculatorEvent {}
