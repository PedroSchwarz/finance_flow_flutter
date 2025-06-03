import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_response.freezed.dart';
part 'user_response.g.dart';

@freezed
abstract class UserResponse with _$UserResponse {
  const factory UserResponse({@JsonKey(name: '_id') required String id, required String firstName, required String lastName, required String email}) =
      _UserResponse;

  factory UserResponse.fromJson(Map<String, dynamic> json) => _$UserResponseFromJson(json);

  const UserResponse._();

  String get initials => '${firstName.substring(0, 1)}${lastName.substring(0, 1)}';

  String get completeName => '${firstName.trim()} ${lastName.trim()}';
}
