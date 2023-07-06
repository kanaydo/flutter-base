import 'package:equatable/equatable.dart';

abstract class BaseExceptions extends Equatable {
  final String message;
  const BaseExceptions({required this.message});
  @override
  List<Object> get props => [message];
}


class DatabaseException extends BaseExceptions {
  const DatabaseException({required super.message}) : super();
}

class ApiException extends BaseExceptions {
  const ApiException({required super.message}) : super();
}