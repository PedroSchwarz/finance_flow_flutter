import 'package:freezed_annotation/freezed_annotation.dart';

part 'credentials_data.freezed.dart';
part 'credentials_data.g.dart';

@freezed
abstract class CredentialsData with _$CredentialsData {
  const factory CredentialsData({required String accessToken}) = _CredentialsData;

  factory CredentialsData.fromJson(Map<String, dynamic> json) => _$CredentialsDataFromJson(json);
}
