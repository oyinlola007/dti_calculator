import 'package:dartz/dartz.dart';
import 'package:dti_calculator/core/error/failures.dart';
import 'package:dti_calculator/features/disclaimer/data/datasource/onboarding_local_datasource.dart';
import 'package:dti_calculator/features/disclaimer/domain/repositories/onboarding_repository.dart';

class OnBoardingRepositoryImpl implements OnBoardingRepository {
  final OnBoardingLocalDataSource localDataSource;

  OnBoardingRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, void>> completeOnBoarding() async {
    try {
      return Right(await localDataSource.completeOnBoarding());
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> isOnBoardingCompleted() async {
    try {
      bool result = await localDataSource.getIsOnBoardingCompleted();
      return Right(result);
    } catch (e) {
      return Left(CacheFailure());
    }
  }
}
