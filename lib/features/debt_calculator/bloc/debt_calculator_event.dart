part of 'debt_calculator_bloc.dart';

abstract class DebtCalculatorEvent extends Equatable {
  const DebtCalculatorEvent();
  @override
  List<Object> get props => [];
}

class UpdateEmployeeType extends DebtCalculatorEvent {
  final String employeeType;

  const UpdateEmployeeType(this.employeeType);

  @override
  List<Object> get props => [employeeType];
}

class UpdateSalaryType extends DebtCalculatorEvent {
  final String salaryType;

  const UpdateSalaryType(this.salaryType);

  @override
  List<Object> get props => [salaryType];
}

class Reset extends DebtCalculatorEvent {}
