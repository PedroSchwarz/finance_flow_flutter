import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data.freezed.dart';
part 'user_data.g.dart';

@freezed
abstract class UserData with _$UserData {
  const factory UserData({
    required String id,
    required String firstName,
    required String lastName,
    required String email,
    required DateTime createdAt,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);

  const UserData._();

  String get completeName => '${firstName.trim()} ${lastName.trim()}';

  String get initials => '${firstName.substring(0, 1)}${lastName.substring(0, 1)}';
}
