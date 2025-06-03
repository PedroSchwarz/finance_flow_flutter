import 'package:dio/dio.dart' hide Headers;
import 'package:finance_flow/groups/data/models/create_group_request.dart';
import 'package:finance_flow/groups/data/models/group_response.dart';
import 'package:finance_flow/groups/data/models/update_group_request.dart';
import 'package:retrofit/retrofit.dart';

part 'groups_remote_data_source.g.dart';

@RestApi(baseUrl: '/groups')
abstract class GroupsRemoteDataSource {
  factory GroupsRemoteDataSource(Dio dio, {String? baseUrl, ParseErrorLogger? errorLogger}) = _GroupsRemoteDataSource;

  @GET('/')
  @Headers(<String, dynamic>{'Content-Type': 'application/json'})
  Future<List<GroupResponse>> fetchAll();

  @GET('/{id}')
  @Headers(<String, dynamic>{'Content-Type': 'application/json'})
  Future<GroupResponse> fetchById(@Path('id') String id);

  @POST('/')
  @Headers(<String, dynamic>{'Content-Type': 'application/json'})
  Future<String> create(@Body() CreateGroupRequest request);

  @POST('/{id}/member')
  @Headers(<String, dynamic>{'Content-Type': 'application/json'})
  Future<void> addMember(@Path('id') String id);

  @POST('/{id}/leave')
  @Headers(<String, dynamic>{'Content-Type': 'application/json'})
  Future<void> leave(@Path('id') String id);

  @PUT('/{id}')
  @Headers(<String, dynamic>{'Content-Type': 'application/json'})
  Future<void> update(@Path('id') String id, @Body() UpdateGroupRequest request);

  @DELETE('/{id}')
  @Headers(<String, dynamic>{'Content-Type': 'application/json'})
  Future<void> delete(@Path('id') String id);
}
