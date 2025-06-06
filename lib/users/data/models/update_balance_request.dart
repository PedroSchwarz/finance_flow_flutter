import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_balance_request.freezed.dart';
part 'update_balance_request.g.dart';

@freezed
abstract class UpdateBalanceRequest with _$UpdateBalanceRequest {
  const factory UpdateBalanceRequest({required double amount}) = _UpdateBalanceRequest;

  factory UpdateBalanceRequest.fromJson(Map<String, dynamic> json) => _$UpdateBalanceRequestFromJson(json);
}
