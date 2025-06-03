import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_invite_request.freezed.dart';
part 'create_invite_request.g.dart';

@freezed
abstract class CreateInviteRequest with _$CreateInviteRequest {
  const factory CreateInviteRequest({required String to, required String groupId}) = _CreateInviteRequest;

  factory CreateInviteRequest.fromJson(Map<String, dynamic> json) => _$CreateInviteRequestFromJson(json);
}
