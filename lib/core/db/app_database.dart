import 'package:bcrypt/bcrypt.dart';
import 'package:drift/drift.dart';

import '../../domain/tables/administrators.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [
  Administrators
])
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e): super(e);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();

        await into(administrators).insert(await seedAdministrator());
      }
    );
  }
}

Future<AdministratorsCompanion> seedAdministrator() async {
  return AdministratorsCompanion.insert(
      fullName: 'Super Administrator',
      username: 'super_administrator',
      passwordDigest: BCrypt.hashpw('1234567890', BCrypt.gensalt()),
      pinDigest: BCrypt.hashpw('123456', BCrypt.gensalt()),
      roleId: 'da'
  );
}