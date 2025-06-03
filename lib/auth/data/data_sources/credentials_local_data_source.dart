import 'dart:convert';

import 'package:finance_flow/app/storage/app_local_storage.dart';
import 'package:finance_flow/auth/data/models/credentials_data.dart';
import 'package:flutter/foundation.dart';

class CredentialsLocalDataSource {
  const CredentialsLocalDataSource({required this.localStorage});

  @visibleForTesting
  final AppLocalStorage localStorage;

  Future<CredentialsData?> load() async {
    final value = await localStorage.read(LocalStorageKey.credentials);

    if (value == null) {
      return null;
    }

    return CredentialsData.fromJson(jsonDecode(value));
  }

  Future<void> save(CredentialsData value) async {
    await localStorage.write(LocalStorageKey.credentials, jsonEncode(value.toJson()));
  }

  Future<void> delete() async {
    await localStorage.delete(LocalStorageKey.credentials);
  }
}
