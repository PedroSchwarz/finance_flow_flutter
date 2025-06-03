import 'package:dio/dio.dart' hide Headers;
import 'package:finance_flow/invites/data/models/create_invite_request.dart';
import 'package:finance_flow/invites/data/models/invite_response.dart';
import 'package:retrofit/retrofit.dart';

part 'invites_remote_data_source.g.dart';

@RestApi(baseUrl: '/invites')
abstract class InvitesRemoteDataSource {
  factory InvitesRemoteDataSource(Dio dio, {String? baseUrl, ParseErrorLogger? errorLogger}) = _InvitesRemoteDataSource;

  @GET('/')
  @Headers(<String, dynamic>{'Content-Type': 'application/json'})
  Future<List<InviteResponse>> fetchAll(@Query('status') String status);

  @POST('/')
  @Headers(<String, dynamic>{'Content-Type': 'application/json'})
  Future<void> create(@Body() CreateInviteRequest request);

  @PUT('/{id}/accept')
  @Headers(<String, dynamic>{'Content-Type': 'application/json'})
  Future<void> accept(@Path('id') String id);

  @PUT('/{id}/reject')
  @Headers(<String, dynamic>{'Content-Type': 'application/json'})
  Future<void> reject(@Path('id') String id);
}
