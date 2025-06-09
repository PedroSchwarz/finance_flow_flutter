import 'package:dio/dio.dart' hide Headers;
import 'package:finance_flow/transactions/transactions.dart';
import 'package:retrofit/retrofit.dart';

part 'transactions_remote_data_source.g.dart';

@RestApi(baseUrl: '/transactions')
abstract class TransactionsRemoteDataSource {
  factory TransactionsRemoteDataSource(Dio dio, {String? baseUrl, ParseErrorLogger? errorLogger}) = _TransactionsRemoteDataSource;

  @GET('/')
  @Headers(<String, dynamic>{'Content-Type': 'application/json'})
  Future<List<TransactionResponse>> fetchAll();

  @GET('/{id}')
  @Headers(<String, dynamic>{'Content-Type': 'application/json'})
  Future<TransactionResponse> fetchById(@Path('id') String id);

  @POST('/')
  @Headers(<String, dynamic>{'Content-Type': 'application/json'})
  Future<void> create(@Body() CreateTransactionRequest request);

  // @PUT('/{id}')
  // @Headers(<String, dynamic>{'Content-Type': 'application/json'})
  // Future<void> update(@Path('id') String id, @Body() UpdateGroupRequest request);

  @DELETE('/{id}')
  @Headers(<String, dynamic>{'Content-Type': 'application/json'})
  Future<void> delete(@Path('id') String id);
}
