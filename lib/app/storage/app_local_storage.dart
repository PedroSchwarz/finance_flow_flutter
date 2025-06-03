import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLocalStorage {
  const AppLocalStorage({required this.secureStorage, required this.sharedPreferences});

  final FlutterSecureStorage secureStorage;
  final SharedPreferences sharedPreferences;

  Future<void> create() async {
    final isFirstRun = sharedPreferences.getBool('isFirstRun') ?? true;
    if (isFirstRun) {
      await secureStorage.deleteAll();
      await sharedPreferences.setBool('isFirstRun', false);
    }
  }

  Future<void> write(Enum key, String value) async {
    await secureStorage.write(key: key.name, value: value);
  }

  Future<String?> read(Enum key) async {
    return secureStorage.read(key: key.name);
  }

  Future<void> delete(Enum key) async {
    await secureStorage.delete(key: key.name);
  }
}

enum LocalStorageKey { credentials, user, showProgression, showHighlights, tasksListView, progressionSelection, groupsListType }
