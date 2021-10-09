import 'package:dartz/dartz.dart';
import 'package:dti_calculator/core/error/failures.dart';

abstract class OnBoardingRepository {
  Future<Either<Failure, void>> completeOnBoarding();

  Future<Either<Failure, bool>> isOnBoardingCompleted();
}
