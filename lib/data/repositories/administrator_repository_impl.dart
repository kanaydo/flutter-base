import 'package:dartz/dartz.dart';

import '../../core/db/app_database.dart';
import '../../core/errors/exceptions.dart';
import '../../domain/repositories/administrator_repository.dart';
import '../params/AuthParams.dart';

class AdministratorRepositoryImpl implements AdministratorRepository {

  @override
  Future<Either<BaseExceptions, Administrator?>> validate(AuthParams authParams) {
    throw UnimplementedError();
  }
}