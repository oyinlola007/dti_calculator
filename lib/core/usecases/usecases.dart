import 'package:dartz/dartz.dart';
import 'package:dti_calculator/core/error/failures.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

class PaginationSearchParams extends Equatable {
  final int pageNo;
  final String searchKeyWord;

  PaginationSearchParams({required this.pageNo, required this.searchKeyWord});
  @override
  List<Object> get props => [pageNo, searchKeyWord];
}
