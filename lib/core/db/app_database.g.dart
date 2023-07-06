// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $AdministratorsTable extends Administrators
    with TableInfo<$AdministratorsTable, Administrator> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AdministratorsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => uuid.v4());
  static const VerificationMeta _fullNameMeta =
      const VerificationMeta('fullName');
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
      'full_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _usernameMeta =
      const VerificationMeta('username');
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
      'username', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _passwordDigestMeta =
      const VerificationMeta('passwordDigest');
  @override
  late final GeneratedColumn<String> passwordDigest = GeneratedColumn<String>(
      'password_digest', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _pinDigestMeta =
      const VerificationMeta('pinDigest');
  @override
  late final GeneratedColumn<String> pinDigest = GeneratedColumn<String>(
      'pin_digest', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _roleIdMeta = const VerificationMeta('roleId');
  @override
  late final GeneratedColumn<String> roleId = GeneratedColumn<String>(
      'role_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusIdMeta =
      const VerificationMeta('statusId');
  @override
  late final GeneratedColumnWithTypeConverter<AdministratorStatus, int>
      statusId = GeneratedColumn<int>('status_id', aliasedName, false,
              type: DriftSqlType.int,
              requiredDuringInsert: false,
              clientDefault: () => AdministratorStatus.active.index)
          .withConverter<AdministratorStatus>(
              $AdministratorsTable.$converterstatusId);
  @override
  List<GeneratedColumn> get $columns =>
      [id, fullName, username, passwordDigest, pinDigest, roleId, statusId];
  @override
  String get aliasedName => _alias ?? 'administrators';
  @override
  String get actualTableName => 'administrators';
  @override
  VerificationContext validateIntegrity(Insertable<Administrator> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('full_name')) {
      context.handle(_fullNameMeta,
          fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta));
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('password_digest')) {
      context.handle(
          _passwordDigestMeta,
          passwordDigest.isAcceptableOrUnknown(
              data['password_digest']!, _passwordDigestMeta));
    } else if (isInserting) {
      context.missing(_passwordDigestMeta);
    }
    if (data.containsKey('pin_digest')) {
      context.handle(_pinDigestMeta,
          pinDigest.isAcceptableOrUnknown(data['pin_digest']!, _pinDigestMeta));
    } else if (isInserting) {
      context.missing(_pinDigestMeta);
    }
    if (data.containsKey('role_id')) {
      context.handle(_roleIdMeta,
          roleId.isAcceptableOrUnknown(data['role_id']!, _roleIdMeta));
    } else if (isInserting) {
      context.missing(_roleIdMeta);
    }
    context.handle(_statusIdMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id, username};
  @override
  Administrator map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Administrator(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      fullName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}full_name'])!,
      username: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}username'])!,
      passwordDigest: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}password_digest'])!,
      pinDigest: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pin_digest'])!,
      roleId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}role_id'])!,
      statusId: $AdministratorsTable.$converterstatusId.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}status_id'])!),
    );
  }

  @override
  $AdministratorsTable createAlias(String alias) {
    return $AdministratorsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<AdministratorStatus, int, int> $converterstatusId =
      const EnumIndexConverter<AdministratorStatus>(AdministratorStatus.values);
}

class Administrator extends DataClass implements Insertable<Administrator> {
  final String id;
  final String fullName;
  final String username;
  final String passwordDigest;
  final String pinDigest;
  final String roleId;
  final AdministratorStatus statusId;
  const Administrator(
      {required this.id,
      required this.fullName,
      required this.username,
      required this.passwordDigest,
      required this.pinDigest,
      required this.roleId,
      required this.statusId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['full_name'] = Variable<String>(fullName);
    map['username'] = Variable<String>(username);
    map['password_digest'] = Variable<String>(passwordDigest);
    map['pin_digest'] = Variable<String>(pinDigest);
    map['role_id'] = Variable<String>(roleId);
    {
      final converter = $AdministratorsTable.$converterstatusId;
      map['status_id'] = Variable<int>(converter.toSql(statusId));
    }
    return map;
  }

  AdministratorsCompanion toCompanion(bool nullToAbsent) {
    return AdministratorsCompanion(
      id: Value(id),
      fullName: Value(fullName),
      username: Value(username),
      passwordDigest: Value(passwordDigest),
      pinDigest: Value(pinDigest),
      roleId: Value(roleId),
      statusId: Value(statusId),
    );
  }

  factory Administrator.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Administrator(
      id: serializer.fromJson<String>(json['id']),
      fullName: serializer.fromJson<String>(json['fullName']),
      username: serializer.fromJson<String>(json['username']),
      passwordDigest: serializer.fromJson<String>(json['passwordDigest']),
      pinDigest: serializer.fromJson<String>(json['pinDigest']),
      roleId: serializer.fromJson<String>(json['roleId']),
      statusId: $AdministratorsTable.$converterstatusId
          .fromJson(serializer.fromJson<int>(json['statusId'])),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'fullName': serializer.toJson<String>(fullName),
      'username': serializer.toJson<String>(username),
      'passwordDigest': serializer.toJson<String>(passwordDigest),
      'pinDigest': serializer.toJson<String>(pinDigest),
      'roleId': serializer.toJson<String>(roleId),
      'statusId': serializer.toJson<int>(
          $AdministratorsTable.$converterstatusId.toJson(statusId)),
    };
  }

  Administrator copyWith(
          {String? id,
          String? fullName,
          String? username,
          String? passwordDigest,
          String? pinDigest,
          String? roleId,
          AdministratorStatus? statusId}) =>
      Administrator(
        id: id ?? this.id,
        fullName: fullName ?? this.fullName,
        username: username ?? this.username,
        passwordDigest: passwordDigest ?? this.passwordDigest,
        pinDigest: pinDigest ?? this.pinDigest,
        roleId: roleId ?? this.roleId,
        statusId: statusId ?? this.statusId,
      );
  @override
  String toString() {
    return (StringBuffer('Administrator(')
          ..write('id: $id, ')
          ..write('fullName: $fullName, ')
          ..write('username: $username, ')
          ..write('passwordDigest: $passwordDigest, ')
          ..write('pinDigest: $pinDigest, ')
          ..write('roleId: $roleId, ')
          ..write('statusId: $statusId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, fullName, username, passwordDigest, pinDigest, roleId, statusId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Administrator &&
          other.id == this.id &&
          other.fullName == this.fullName &&
          other.username == this.username &&
          other.passwordDigest == this.passwordDigest &&
          other.pinDigest == this.pinDigest &&
          other.roleId == this.roleId &&
          other.statusId == this.statusId);
}

class AdministratorsCompanion extends UpdateCompanion<Administrator> {
  final Value<String> id;
  final Value<String> fullName;
  final Value<String> username;
  final Value<String> passwordDigest;
  final Value<String> pinDigest;
  final Value<String> roleId;
  final Value<AdministratorStatus> statusId;
  final Value<int> rowid;
  const AdministratorsCompanion({
    this.id = const Value.absent(),
    this.fullName = const Value.absent(),
    this.username = const Value.absent(),
    this.passwordDigest = const Value.absent(),
    this.pinDigest = const Value.absent(),
    this.roleId = const Value.absent(),
    this.statusId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AdministratorsCompanion.insert({
    this.id = const Value.absent(),
    required String fullName,
    required String username,
    required String passwordDigest,
    required String pinDigest,
    required String roleId,
    this.statusId = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : fullName = Value(fullName),
        username = Value(username),
        passwordDigest = Value(passwordDigest),
        pinDigest = Value(pinDigest),
        roleId = Value(roleId);
  static Insertable<Administrator> custom({
    Expression<String>? id,
    Expression<String>? fullName,
    Expression<String>? username,
    Expression<String>? passwordDigest,
    Expression<String>? pinDigest,
    Expression<String>? roleId,
    Expression<int>? statusId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fullName != null) 'full_name': fullName,
      if (username != null) 'username': username,
      if (passwordDigest != null) 'password_digest': passwordDigest,
      if (pinDigest != null) 'pin_digest': pinDigest,
      if (roleId != null) 'role_id': roleId,
      if (statusId != null) 'status_id': statusId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AdministratorsCompanion copyWith(
      {Value<String>? id,
      Value<String>? fullName,
      Value<String>? username,
      Value<String>? passwordDigest,
      Value<String>? pinDigest,
      Value<String>? roleId,
      Value<AdministratorStatus>? statusId,
      Value<int>? rowid}) {
    return AdministratorsCompanion(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      username: username ?? this.username,
      passwordDigest: passwordDigest ?? this.passwordDigest,
      pinDigest: pinDigest ?? this.pinDigest,
      roleId: roleId ?? this.roleId,
      statusId: statusId ?? this.statusId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (passwordDigest.present) {
      map['password_digest'] = Variable<String>(passwordDigest.value);
    }
    if (pinDigest.present) {
      map['pin_digest'] = Variable<String>(pinDigest.value);
    }
    if (roleId.present) {
      map['role_id'] = Variable<String>(roleId.value);
    }
    if (statusId.present) {
      final converter = $AdministratorsTable.$converterstatusId;
      map['status_id'] = Variable<int>(converter.toSql(statusId.value));
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AdministratorsCompanion(')
          ..write('id: $id, ')
          ..write('fullName: $fullName, ')
          ..write('username: $username, ')
          ..write('passwordDigest: $passwordDigest, ')
          ..write('pinDigest: $pinDigest, ')
          ..write('roleId: $roleId, ')
          ..write('statusId: $statusId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $AdministratorsTable administrators = $AdministratorsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [administrators];
}
