part of 'student_loan_bloc.dart';

class StudentLoanState extends Equatable {
  StudentLoanState({
    this.doYouHaveStudentLoan = "YES",
    this.loanAmount = 0,
  });

  // LOAN
  final String doYouHaveStudentLoan;
  final num loanAmount;

  StudentLoanState copyWith({
    // LOAN
    String? doYouHaveStudentLoan,
    num? loanAmount,
  }) {
    return StudentLoanState(
      doYouHaveStudentLoan: doYouHaveStudentLoan ?? this.doYouHaveStudentLoan,
      loanAmount: loanAmount ?? this.loanAmount,
    );
  }

  @override
  List<Object> get props => [
        doYouHaveStudentLoan,
        loanAmount,
      ];
}
