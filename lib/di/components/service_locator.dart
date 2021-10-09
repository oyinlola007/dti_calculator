import 'package:dti_calculator/features/disclaimer/data/datasource/onboarding_local_datasource.dart';
import 'package:dti_calculator/features/disclaimer/data/repositories/onboarding_repository_impl.dart';
import 'package:dti_calculator/features/disclaimer/domain/repositories/onboarding_repository.dart';
import 'package:dti_calculator/features/disclaimer/domain/usecases/complete_on_boarding.dart';
import 'package:dti_calculator/features/disclaimer/domain/usecases/get_on_boarding_completed.dart';
import 'package:dti_calculator/routing/navigation_service.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  /// NAVIGATOR
  getIt.registerLazySingleton(() => NavigationService());

  /// EXTERNAL DEPENDENCIES
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);

  getIt.registerLazySingleton(() => InternetConnectionChecker());

  /// ON-BOARDING
  registerOnBoardingFeature(getIt);
}

void registerOnBoardingFeature(GetIt getIt) {
  getIt.registerLazySingleton<OnBoardingLocalDataSource>(
      () => OnBoardingLocalDataSourceImpl(getIt()));
  getIt.registerLazySingleton<OnBoardingRepository>(() => OnBoardingRepositoryImpl(getIt()));
  getIt.registerLazySingleton(() => CompleteOnBoardingUseCase(getIt()));
  getIt.registerLazySingleton(() => GetOnBoardingCompletedUseCase(getIt()));
}
