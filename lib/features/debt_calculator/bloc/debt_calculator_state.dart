part of 'debt_calculator_bloc.dart';

class DebtCalculatorState extends Equatable {
  DebtCalculatorState({
    this.debtValues = const <Map<String, num>>[
      {
        "id": 0,
        "value": 0,
      }
    ],
    this.totalDebt = 0,
  });

  final List<Map<String, num>> debtValues;
  final num totalDebt;

  DebtCalculatorState copyWith({
    List<Map<String, num>>? debtValues,
    num? totalDebt,
  }) {
    return DebtCalculatorState(
      debtValues: debtValues ?? this.debtValues,
      totalDebt: totalDebt ?? this.totalDebt,
    );
  }

  @override
  List<Object> get props => [
        debtValues,
        totalDebt,
      ];
}
