import 'package:bloc/bloc.dart';
import 'package:dti_calculator/core/usecases/usecases.dart';
import 'package:dti_calculator/features/disclaimer/domain/usecases/complete_on_boarding.dart';

import 'package:meta/meta.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  CompleteOnBoardingUseCase _completeOnBoardingUseCase;
  OnBoardingCubit(CompleteOnBoardingUseCase completeOnBoardingUseCase)
      : _completeOnBoardingUseCase = completeOnBoardingUseCase,
        super(OnBoardingInitial());

  Future<void> completeOnBoarding() async {
    print("=====> completeOnBoarding");
    var completeOnBoarding = await _completeOnBoardingUseCase.call(NoParams());
    completeOnBoarding.fold((l) => null, (r) => null);
    emit(OnBoardingCompleted());
  }
}
