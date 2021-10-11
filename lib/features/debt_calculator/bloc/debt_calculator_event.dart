part of 'debt_calculator_bloc.dart';

abstract class DebtCalculatorEvent extends Equatable {
  const DebtCalculatorEvent();
  @override
  List<Object> get props => [];
}

class AddNewField extends DebtCalculatorEvent {}

class Clear extends DebtCalculatorEvent {}

class DeleteField extends DebtCalculatorEvent {
  final int index;

  const DeleteField(this.index);

  @override
  List<Object> get props => [index];
}

class UpdateField extends DebtCalculatorEvent {
  final int index;
  final num value;

  const UpdateField(this.index, this.value);

  @override
  List<Object> get props => [index, value];
}

class Reset extends DebtCalculatorEvent {}
