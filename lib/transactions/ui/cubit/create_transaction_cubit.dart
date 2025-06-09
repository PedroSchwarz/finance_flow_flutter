import 'package:finance_flow/transactions/transactions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';

part 'create_transaction_cubit.freezed.dart';

class CreateTransactionCubit extends Cubit<CreateTransactionState> {
  CreateTransactionCubit({required this.transactionsRepository})
    : super(
        const CreateTransactionState(isLoading: false, amount: 0, title: '', type: TransactionType.expense, isSubmitting: false, shouldGoBack: false),
      );

  static final _log = Logger('CreateTransactionCubit');

  @visibleForTesting
  final TransactionsRepository transactionsRepository;

  void updateAmount(double amount) {
    emit(state.copyWith(amount: amount));
  }

  void updateTitle(String title) {
    emit(state.copyWith(title: title));
  }

  void updateDescription(String? description) {
    if (description?.isEmpty ?? false) {
      emit(state.copyWith(description: null));
      return;
    }

    emit(state.copyWith(description: description));
  }

  void updateType(TransactionType type) {
    emit(state.copyWith(type: type));
  }

  Future<void> createTransaction() async {
    emit(state.copyWith(isSubmitting: true));
    try {
      await transactionsRepository.create(
        CreateTransactionRequest(amount: state.amount, title: state.title, type: state.type, description: state.description),
      );
      emit(state.copyWith(shouldGoBack: true));
    } catch (e) {
      _log.severe('Error creating transaction: $e', e);
    } finally {
      emit(state.copyWith(isSubmitting: false));
    }
  }
}

@freezed
sealed class CreateTransactionState with _$CreateTransactionState {
  const factory CreateTransactionState({
    required bool isLoading,
    required double amount,
    required String title,
    required TransactionType type,
    required bool isSubmitting,
    required bool shouldGoBack,
    String? description,
  }) = _CreateTransactionState;

  const CreateTransactionState._();

  bool get isFormValid => amount > 0 && title.isNotEmpty;

  bool get canSubmit => !isSubmitting && isFormValid;
}
