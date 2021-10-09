part of 'app_bloc.dart';

class AppState extends Equatable {
  const AppState._({this.showDisclaimer = true});

  final bool showDisclaimer;

  const AppState.showDisclaimer() : this._();

  const AppState.bypassDisclaimer() : this._(showDisclaimer: false);

  @override
  List<Object> get props => [showDisclaimer];
}
