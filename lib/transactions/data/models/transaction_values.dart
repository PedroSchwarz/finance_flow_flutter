import 'package:freezed_annotation/freezed_annotation.dart';

enum TransactionType {
  @JsonValue('income')
  income,
  @JsonValue('expense')
  expense,
}
