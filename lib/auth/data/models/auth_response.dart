import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_response.freezed.dart';
part 'auth_response.g.dart';

@freezed
abstract class AuthResponse with _$AuthResponse {
  const factory AuthResponse({
    required String id,
    @JsonKey(name: 'access_token') required String accessToken,
    required String firstName,
    required String lastName,
    required String email,
    required DateTime createdAt,
  }) = _AuthResponse;

  factory AuthResponse.fromJson(Map<String, dynamic> json) => _$AuthResponseFromJson(json);
}
