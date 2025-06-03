import 'package:freezed_annotation/freezed_annotation.dart';

part 'build_configurations.freezed.dart';

@freezed
sealed class BuildConfigurations with _$BuildConfigurations {
  const factory BuildConfigurations({required String baseUrl, required Environment environment}) = _BuildConfigurations;
}

enum Environment { development, production }
