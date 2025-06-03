import 'package:dio/dio.dart';
import 'package:finance_flow/app/configurations/data/models/build_configurations.dart';
import 'package:finance_flow/app/storage/app_local_storage.dart';
import 'package:finance_flow/app/ui/navigation.dart';
import 'package:finance_flow/auth/auth.dart';
import 'package:finance_flow/groups/groups.dart';
import 'package:finance_flow/invites/invites.dart';
import 'package:finance_flow/splash/splash.dart';
import 'package:finance_flow/users/users.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

sealed class BaseServiceLocators {
  const BaseServiceLocators();

  static const String noAuthDio = 'no_auth_dio';

  BuildConfigurations get buildConfigurations;

  @mustCallSuper
  Future<void> setup();
}

class Locators extends BaseServiceLocators {
  @override
  BuildConfigurations get buildConfigurations {
    return const BuildConfigurations(baseUrl: 'https://task-master-api-beej.onrender.com/', environment: Environment.production);
  }

  @override
  Future<void> setup() async {
    getIt.registerSingleton(
      const FlutterSecureStorage(
        iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock_this_device),
        aOptions: AndroidOptions(sharedPreferencesName: 'finance_flow_secure_storage', encryptedSharedPreferences: true),
      ),
    );

    final sharedPreferences = await SharedPreferences.getInstance();
    getIt.registerSingleton(sharedPreferences);

    final appStorage = AppLocalStorage(secureStorage: getIt(), sharedPreferences: getIt());
    await appStorage.create();

    getIt
      ..registerSingleton(appStorage)
      ..registerSingleton(buildConfigurations)
      ..registerSingleton(CredentialsLocalDataSource(localStorage: getIt()))
      ..registerSingleton(UserLocalDataSource(localStorage: getIt()))
      ..registerSingleton(CredentialsRepository(credentialsLocalDataSource: getIt()))
      ..registerSingleton(UserRepository(userLocalDataSource: getIt()))
      ..registerSingleton(createAuthenticatedDio(baseUrl: buildConfigurations.baseUrl, credentialsRepository: getIt()))
      ..registerSingleton(createDio(baseUrl: buildConfigurations.baseUrl), instanceName: BaseServiceLocators.noAuthDio)
      ..registerSingleton(AuthRemoteDataSource(getIt(instanceName: BaseServiceLocators.noAuthDio)))
      ..registerSingleton(AuthRepository(authRemoteDataSource: getIt(), userRepository: getIt(), credentialsRepository: getIt()))
      ..registerSingleton(createRouter(authRepository: getIt()))
      ..registerSingleton(SplashRepository(authRepository: getIt()))
      ..registerFactory(() => SplashCubit(splashRepository: getIt()))
      ..registerFactory(() => LoginCubit(authRepository: getIt()))
      ..registerFactory(() => RegisterCubit(authRepository: getIt()))
      ..registerSingleton(UsersRemoteDataSource(getIt()))
      ..registerSingleton(UsersRepository(authRepository: getIt(), usersRemoteDataSource: getIt()))
      ..registerSingleton(InvitesRemoteDataSource(getIt()))
      ..registerSingleton(InvitesRepository(invitesRemoteDataSource: getIt()))
      ..registerSingleton(GroupsRemoteDataSource(getIt()))
      ..registerSingleton(GroupsRepository(groupsRemoteDataSource: getIt()))
      ..registerFactory(
        () => CreateGroupCubit(authRepository: getIt(), groupsRepository: getIt(), invitesRepository: getIt(), usersRepository: getIt()),
      )
      ..registerFactory(() => InvitesCubit(invitesRepository: getIt(), groupsRepository: getIt()))
      ..registerFactory(() => GroupDetailsCubit(authRepository: getIt(), groupsRepository: getIt()));
  }

  Dio createDio({required String baseUrl}) {
    return Dio(BaseOptions(baseUrl: baseUrl));
  }

  Dio createAuthenticatedDio({required String baseUrl, required CredentialsRepository credentialsRepository}) {
    final dio = Dio(BaseOptions(baseUrl: baseUrl));
    final authInterceptor = AuthInterceptor(credentialsRepository: credentialsRepository, dio: dio);
    dio.interceptors.add(authInterceptor);
    return dio;
  }
}
