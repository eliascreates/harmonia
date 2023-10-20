import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure({this.message = 'Unexpected failure occurred'});

  final String message;

  @override
  String toString() => 'Failure(message: $message)';

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure({super.message});

  @override
  List<Object?> get props => [message];
}

class CacheFailure extends Failure {
  const CacheFailure({required super.message});

  @override
  List<Object?> get props => [message];
}
