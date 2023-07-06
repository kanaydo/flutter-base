/*
 * Created by kanaydo on 9/17/22, 11:02 PM
 * Copyright (c) 2022 . All rights reserved.
 * Last modified 9/17/22, 11:01 PM
 */


import '../../core/db/app_database.dart';

class LocalSessionPayload {
  final String id;
  final String fullName;
  LocalSessionPayload({required this.id, required this.fullName});

  factory LocalSessionPayload.fromAdministrator(Administrator administrator) {
    return LocalSessionPayload(
        id: administrator.id,
        fullName: administrator.fullName
    );
  }

  factory LocalSessionPayload.fromJson(Map<String, dynamic> json) {
    return LocalSessionPayload(
        id: json['id'],
        fullName: json['full_name']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'full_name': fullName,
    };
  }
}