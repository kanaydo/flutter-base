import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum AdministratorStatus {
  active,
  inactive
}

@DataClassName('Administrator')
class Administrators extends Table {
  TextColumn get id => text().named('id').clientDefault(() => uuid.v4())();
  TextColumn get fullName => text().named('full_name')();
  TextColumn get username => text().named('username').unique()();
  TextColumn get passwordDigest => text().named('password_digest')();
  TextColumn get pinDigest => text().named('pin_digest')();
  TextColumn get roleId => text().named('role_id')();
  IntColumn get statusId => intEnum<AdministratorStatus>().named('status_id').clientDefault(() => AdministratorStatus.active.index)();

  @override
  Set<Column> get primaryKey => {id, username};
}