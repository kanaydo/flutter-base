import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';

import '../../core/db/app_database.dart';
import '../security_provider.dart';
import 'local_session_payload.dart';

class SessionManager {
  static const String kBaseSession = "SESSION_MANAGER";
  static const String kActiveToken = "${kBaseSession}_ACTIVE_TOKEN";

  final SecurityProvider securityProvider;

  final Box _session = Hive.box(kBaseSession);

  SessionManager({required this.securityProvider});

  void setLocalSession(Administrator administrator) {
    final sessionPayload = LocalSessionPayload.fromAdministrator(administrator);
    final encSession = securityProvider.encrypt(json.encode(sessionPayload.toJson()));
    _session.put(kActiveToken, encSession);
  }

  LocalSessionPayload? getLocalSession() {
    final token = _session.get(kActiveToken);
    if (token == null) return null;

    final decSession = securityProvider.decrypt(token);
    try {
      Map<String, dynamic> decodedSession = json.decode(decSession);
      LocalSessionPayload payload = LocalSessionPayload.fromJson(decodedSession);
      return payload;
    } catch (e) {
      return null;
    }
  }
}