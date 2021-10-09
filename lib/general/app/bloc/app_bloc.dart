import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dti_calculator/core/usecases/usecases.dart';
import 'package:dti_calculator/features/disclaimer/domain/usecases/get_on_boarding_completed.dart';
import 'package:equatable/equatable.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  GetOnBoardingCompletedUseCase _getOnBoardingCompletedUseCase;

  AppBloc({required GetOnBoardingCompletedUseCase getOnBoardingCompletedUseCase})
      : _getOnBoardingCompletedUseCase = getOnBoardingCompletedUseCase,
        super(AppState.showDisclaimer());

  @override
  Stream<AppState> mapEventToState(
    AppEvent event,
  ) async* {
    if (event is GetAppState) {
      yield* _mapGetAppStateToState(event, state);
    }
  }

  Stream<AppState> _mapGetAppStateToState(GetAppState event, AppState state) async* {
    bool onBoardingComplete = false;
    bool userLoggedIn = false;

    var onBoardingCompleteOrFailure = await _getOnBoardingCompletedUseCase.call(NoParams());
    onBoardingCompleteOrFailure.fold((l) {
      onBoardingComplete = false;
      print("===> $l");
      print("===>Cached on-boarding failure");
    }, (r) {
      onBoardingComplete = r;
      print("===> $r");
      print("===>Cached on-boarding success");
    });

    if (onBoardingComplete) {
      yield AppState.bypassDisclaimer();
      return;
    }
    yield AppState.showDisclaimer();
  }
}
