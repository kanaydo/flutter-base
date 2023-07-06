
import 'package:dartz/dartz.dart';

import '../../core/db/app_database.dart';
import '../../core/errors/exceptions.dart';
import '../../data/params/AuthParams.dart';

abstract class AdministratorRepository {
  Future<Either<BaseExceptions, Administrator?>> validate(AuthParams authParams);
}