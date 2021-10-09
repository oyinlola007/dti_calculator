import 'package:dartz/dartz.dart';
import 'package:dti_calculator/core/error/failures.dart';
import 'package:dti_calculator/core/usecases/usecases.dart';
import 'package:dti_calculator/features/disclaimer/domain/repositories/onboarding_repository.dart';

class GetOnBoardingCompletedUseCase implements UseCase<bool, NoParams> {
  final OnBoardingRepository repository;

  GetOnBoardingCompletedUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) {
    return repository.isOnBoardingCompleted();
  }
}
