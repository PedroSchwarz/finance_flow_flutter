import 'package:finance_flow/auth/data/data_sources/user_local_data_source.dart';
import 'package:finance_flow/auth/data/models/user_data.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class UserRepository {
  UserRepository({required this.userLocalDataSource});

  @visibleForTesting
  final UserLocalDataSource userLocalDataSource;

  @visibleForTesting
  final userController = BehaviorSubject<UserData?>.seeded(null);
  ValueStream<UserData?> get currentUser => userController.stream;

  Future<void> init() async {
    final storedUser = await userLocalDataSource.load();

    if (storedUser != null) {
      userController.add(storedUser);
    }
  }

  Future<void> updateUser(UserData? value) async {
    if (value == null) {
      userController.add(null);
      await userLocalDataSource.delete();
    } else {
      userController.add(value);
      await userLocalDataSource.save(value);
    }
  }
}
