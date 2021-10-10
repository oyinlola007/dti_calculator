import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'student_loan_event.dart';
part 'student_loan_state.dart';

class StudentLoanBloc extends Bloc<StudentLoanEvent, StudentLoanState> {
  StudentLoanBloc() : super(StudentLoanState());

  @override
  Stream<StudentLoanState> mapEventToState(StudentLoanEvent event) async* {
    if (event is UpdateDoYouHaveStudentLoan) {
      yield* _mapUpdateDoYouHaveStudentLoanEventToState(event);
    }

    if (event is UpdateStudentLoanValue) {
      yield* _mapUpdateStudentLoanValueEventToState(event);
    }
  }

  Stream<StudentLoanState> _mapUpdateDoYouHaveStudentLoanEventToState(
      UpdateDoYouHaveStudentLoan event) async* {
    if (event.string == "NO") {
      yield state.copyWith(doYouHaveStudentLoan: event.string, loanAmount: 0);
    } else {
      yield state.copyWith(doYouHaveStudentLoan: event.string);
    }
  }

  Stream<StudentLoanState> _mapUpdateStudentLoanValueEventToState(
      UpdateStudentLoanValue event) async* {
    num debt = event.studentLoanValue * 0.005;
    yield state.copyWith(loanAmount: debt);
  }
}
