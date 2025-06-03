import 'package:finance_flow/users/users.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'invite_response.freezed.dart';
part 'invite_response.g.dart';

enum InviteStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('accepted')
  accepted,
  @JsonValue('rejected')
  rejected,
}

@freezed
abstract class InviteResponse with _$InviteResponse {
  const factory InviteResponse({
    @JsonKey(name: '_id') required String id,
    required UserResponse from,
    required InviteGroupResponse group,
    required InviteStatus status,
    required DateTime createdAt,
  }) = _InviteResponse;

  factory InviteResponse.fromJson(Map<String, dynamic> json) => _$InviteResponseFromJson(json);
}

@freezed
abstract class InviteGroupResponse with _$InviteGroupResponse {
  const factory InviteGroupResponse({@JsonKey(name: '_id') required String id, required String name}) = _InviteGroupResponse;

  factory InviteGroupResponse.fromJson(Map<String, dynamic> json) => _$InviteGroupResponseFromJson(json);
}
