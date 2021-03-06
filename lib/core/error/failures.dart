import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

// General failures
class DioFailure extends Failure {}

class ConnectionFailure extends Failure {}

class CacheFailure extends Failure {}
