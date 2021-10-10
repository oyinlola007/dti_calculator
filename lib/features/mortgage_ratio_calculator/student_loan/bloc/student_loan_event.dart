part of 'student_loan_bloc.dart';

abstract class StudentLoanEvent extends Equatable {
  const StudentLoanEvent();
  @override
  List<Object> get props => [];
}

class UpdateDoYouHaveStudentLoan extends StudentLoanEvent {
  final String string;

  const UpdateDoYouHaveStudentLoan(this.string);

  @override
  List<Object> get props => [string];
}

class UpdateStudentLoanValue extends StudentLoanEvent {
  final num studentLoanValue;

  const UpdateStudentLoanValue(this.studentLoanValue);

  @override
  List<Object> get props => [studentLoanValue];
}

class Reset extends StudentLoanEvent {}
