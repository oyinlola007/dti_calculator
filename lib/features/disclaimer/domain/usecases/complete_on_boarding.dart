import 'package:dartz/dartz.dart';
import 'package:dti_calculator/core/error/failures.dart';
import 'package:dti_calculator/core/usecases/usecases.dart';
import 'package:dti_calculator/features/disclaimer/domain/repositories/onboarding_repository.dart';

class CompleteOnBoardingUseCase implements UseCase<void, NoParams> {
  final OnBoardingRepository repository;

  CompleteOnBoardingUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(NoParams params) {
    return repository.completeOnBoarding();
  }
}
