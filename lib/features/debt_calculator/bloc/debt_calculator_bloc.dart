import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dti_calculator/res/strings.dart';
import 'package:equatable/equatable.dart';

part 'debt_calculator_event.dart';
part 'debt_calculator_state.dart';

class DebtCalculatorBloc extends Bloc<DebtCalculatorEvent, DebtCalculatorState> {
  DebtCalculatorBloc() : super(DebtCalculatorState());

  @override
  Stream<DebtCalculatorState> mapEventToState(DebtCalculatorEvent event) async* {
    if (event is AddNewField) {
      yield* _mapAddNewFieldEventToState();
    }

    if (event is DeleteField) {
      yield* _mapDeleteFieldEventToState(event);
    }

    if (event is UpdateField) {
      yield* _mapUpdateFieldEventToState(event);
    }
  }

  Stream<DebtCalculatorState> _mapAddNewFieldEventToState() async* {
    var l = state.debtValues.length;
    List<Map<String, num>> values = [];
    values.addAll(state.debtValues);
    values.add({
      "id": l,
      "value": 0,
    });
    yield state.copyWith(debtValues: values);
  }

  Stream<DebtCalculatorState> _mapDeleteFieldEventToState(DeleteField event) async* {
    List<Map<String, num>> values = [];
    values.addAll(state.debtValues);
    values.removeAt(event.index);
    num totalDebt = calculateTotalDebt(values);

    yield state.copyWith(debtValues: values, totalDebt: totalDebt);
  }

  Stream<DebtCalculatorState> _mapUpdateFieldEventToState(UpdateField event) async* {
    List<Map<String, num>> values = [];
    values.addAll(state.debtValues);
    int foundKey = -1;
    for (var map in values) {
      if (map.containsKey("id")) {
        if (map["id"] == event.index) {
          foundKey = event.index;
          break;
        }
      }
    }
    if (-1 != foundKey) {
      values.removeWhere((map) {
        return map["id"] == foundKey;
      });
    }
    Map<String, num> json = {
      "id": event.index,
      "value": event.value,
    };
    values.add(json);

    num totalDebt = calculateTotalDebt(values);

    yield state.copyWith(debtValues: values, totalDebt: totalDebt);
  }

  num calculateTotalDebt(List<Map<String, num>> values) {
    num total = 0;
    values.forEach((element) {
      var value = element['value'];
      total += value!;
    });

    return total;
  }
}
