import 'package:dio/dio.dart' hide Headers;
import 'package:finance_flow/users/data/models/device_token_request.dart';
import 'package:finance_flow/users/data/models/update_balance_request.dart';
import 'package:finance_flow/users/data/models/user_response.dart';
import 'package:retrofit/retrofit.dart';

part 'users_remote_data_source.g.dart';

@RestApi(baseUrl: '/users')
abstract class UsersRemoteDataSource {
  factory UsersRemoteDataSource(Dio dio, {String? baseUrl, ParseErrorLogger? errorLogger}) = _UsersRemoteDataSource;

  @GET('/')
  @Headers(<String, dynamic>{'Content-Type': 'application/json'})
  Future<List<UserResponse>> fetchAll();

  @GET('/balance')
  @Headers(<String, dynamic>{'Content-Type': 'application/json'})
  Future<double> getBalance();

  @PUT('/balance')
  @Headers(<String, dynamic>{'Content-Type': 'application/json'})
  Future<void> updateBalance(@Body() UpdateBalanceRequest request);

  @POST('/device-token')
  @Headers(<String, dynamic>{'Content-Type': 'application/json'})
  Future<void> updateDeviceToken(@Body() DeviceTokenRequest request);
}
