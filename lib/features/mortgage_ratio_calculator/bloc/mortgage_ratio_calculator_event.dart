part of 'mortgage_ratio_calculator_bloc.dart';

abstract class MortgageRatioCalculatorEvent extends Equatable {
  const MortgageRatioCalculatorEvent();
  @override
  List<Object> get props => [];
}

class UpdateEmployeeType extends MortgageRatioCalculatorEvent {
  final String employeeType;

  const UpdateEmployeeType(this.employeeType);

  @override
  List<Object> get props => [employeeType];
}

class UpdateSalaryType extends MortgageRatioCalculatorEvent {
  final String salaryType;

  const UpdateSalaryType(this.salaryType);

  @override
  List<Object> get props => [salaryType];
}

class Reset extends MortgageRatioCalculatorEvent {}
