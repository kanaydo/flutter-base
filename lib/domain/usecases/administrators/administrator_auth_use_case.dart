
import 'package:dartz/dartz.dart';

import '../../../core/commons/use_case.dart';
import '../../../core/db/app_database.dart';
import '../../../core/errors/exceptions.dart';
import '../../../data/params/AuthParams.dart';
import '../../repositories/administrator_repository.dart';

class AdministratorAuthUseCase implements UseCase<Administrator?, AuthParams> {
  final AdministratorRepository administratorRepository;

  AdministratorAuthUseCase({required this.administratorRepository});

  @override
  Future<Either<BaseExceptions, Administrator?>> call(AuthParams params) {
    return administratorRepository.validate(params);
  }
}