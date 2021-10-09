import 'package:shared_preferences/shared_preferences.dart';

abstract class OnBoardingLocalDataSource {
  Future<void> completeOnBoarding();
  Future<bool> getIsOnBoardingCompleted();
}

const IS_ON_BOARDING_COMPLETE = 'IS_ON_BOARDING_COMPLETE';

class OnBoardingLocalDataSourceImpl implements OnBoardingLocalDataSource {
  final SharedPreferences sharedPreferences;

  OnBoardingLocalDataSourceImpl(this.sharedPreferences);

  @override
  Future<void> completeOnBoarding() async {
    await sharedPreferences.setBool(IS_ON_BOARDING_COMPLETE, true);
  }

  @override
  Future<bool> getIsOnBoardingCompleted() async {
    var result = sharedPreferences.getBool(IS_ON_BOARDING_COMPLETE);
    return (result == null) ? false : result;
  }
}
