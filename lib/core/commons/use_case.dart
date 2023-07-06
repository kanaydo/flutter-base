
import 'package:dartz/dartz.dart';

import '../errors/exceptions.dart';

abstract class UseCase<Type, Params> {
  Future<Either<BaseExceptions, Type>> call(Params params);
}