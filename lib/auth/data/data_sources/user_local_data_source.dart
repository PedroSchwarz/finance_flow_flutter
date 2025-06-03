import 'dart:convert';

import 'package:finance_flow/app/storage/app_local_storage.dart';
import 'package:finance_flow/auth/data/models/user_data.dart';
import 'package:flutter/foundation.dart';

class UserLocalDataSource {
  const UserLocalDataSource({required this.localStorage});

  @visibleForTesting
  final AppLocalStorage localStorage;

  Future<UserData?> load() async {
    final value = await localStorage.read(LocalStorageKey.user);

    if (value == null) {
      return null;
    }

    return UserData.fromJson(jsonDecode(value));
  }

  Future<void> save(UserData value) async {
    await localStorage.write(LocalStorageKey.user, jsonEncode(value.toJson()));
  }

  Future<void> delete() async {
    await localStorage.delete(LocalStorageKey.user);
  }
}
