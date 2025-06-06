import 'package:dio/dio.dart';
import 'package:finance_flow/auth/auth.dart';
import 'package:flutter/foundation.dart';

class AuthInterceptor extends Interceptor {
  const AuthInterceptor({required this.authRepository, required this.credentialsRepository, required this.dio});

  @visibleForTesting
  final AuthRepository authRepository;

  @visibleForTesting
  final CredentialsRepository credentialsRepository;

  @visibleForTesting
  final Dio dio;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final credentials = await credentialsRepository.getCredentials();

    if (credentials != null) {
      options.headers['Authorization'] = 'Bearer ${credentials.accessToken}';
    }

    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      await authRepository.signOut();
      // final newToken = await refreshToken();
      // if (newToken != null) {
      //   await saveToken(newToken);

      //   // retry the original request
      //   final clonedRequest = err.requestOptions;
      //   clonedRequest.headers['Authorization'] = 'Bearer $newToken';
      //   final response = await Dio().fetch(clonedRequest);
      //   return handler.resolve(response);
      // }
    }
    return handler.next(err);
  }
}
