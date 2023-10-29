import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:harmonia/core/errors/failures.dart';

abstract class Usecase<Type, Params> {
  const Usecase();
  Future<Either<Failure, Type>> call(Params params);
}

abstract class UsecaseStream<Type, Params> {
  const UsecaseStream();
  Stream<Type> call(Params params);
}

class NoParams extends Equatable {
  const NoParams();

  @override
  List<Object?> get props => [];
}
