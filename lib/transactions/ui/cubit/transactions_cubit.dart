import 'package:calendar_pager/utils/extensions/date_extensions.dart';
import 'package:collection/collection.dart';
import 'package:finance_flow/transactions/transactions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';

part 'transactions_cubit.freezed.dart';

class TransactionsCubit extends Cubit<TransactionsState> {
  TransactionsCubit({required this.transactionsRepository})
    : super(
        TransactionsState(
          isLoading: false,
          selectedDate: DateTime.now(),
          transactions: [],
          listType: TransactionsListType.calendar,
          typeFilter: TransactionsTypeFilter.all,
          dateSort: TransactionsDateSort.newest,
          isRefreshing: false,
        ),
      );

  static final _log = Logger('TransactionsCubit');

  @visibleForTesting
  final TransactionsRepository transactionsRepository;

  Future<void> load() async {
    emit(state.copyWith(isLoading: true));
    await Future.wait([loadTransactions()]);
    emit(state.copyWith(isLoading: false));
  }

  Future<void> refresh() async {
    emit(state.copyWith(isRefreshing: true));
    await Future.wait([loadTransactions()]);
    emit(state.copyWith(isRefreshing: false));
  }

  Future<void> loadTransactions() async {
    try {
      final transactions = await transactionsRepository.getTransactions();
      emit(state.copyWith(transactions: transactions));
    } catch (e) {
      _log.severe('Error loading transactions: $e', e);
    }
  }

  void updateSelectedDate(DateTime date) {
    emit(state.copyWith(selectedDate: date));
  }

  void updateListType(TransactionsListType listType) {
    emit(state.copyWith(listType: listType));
  }

  void updateTransactionsTypeFilter(TransactionsTypeFilter typeFilter) {
    emit(state.copyWith(typeFilter: typeFilter));
  }

  void updateDateSort(TransactionsDateSort dateSort) {
    emit(state.copyWith(dateSort: dateSort));
  }

  void selectTransactionToDelete(TransactionResponse? transaction) {
    emit(state.copyWith(transactionToBeDeleted: transaction));
  }

  Future<void> deleteTransaction() async {
    final transaction = state.transactionToBeDeleted;

    if (transaction == null) {
      return;
    }

    emit(state.copyWith(isRefreshing: true, transactionToBeDeleted: null));

    try {
      await transactionsRepository.delete(transaction.id);
      await refresh();
    } catch (e) {
      _log.severe('Error deleting transaction: $e', e);
    } finally {
      emit(state.copyWith(isRefreshing: false));
    }
  }
}

@freezed
sealed class TransactionsState with _$TransactionsState {
  const factory TransactionsState({
    required bool isLoading,
    required DateTime selectedDate,
    required List<TransactionResponse> transactions,
    required TransactionsListType listType,
    required TransactionsTypeFilter typeFilter,
    required TransactionsDateSort dateSort,
    required bool isRefreshing,
    TransactionResponse? transactionToBeDeleted,
  }) = _TransactionsState;

  const TransactionsState._();

  List<TransactionResponse> get filteredTransactions =>
      transactions
          .where((transaction) {
            switch (listType) {
              case TransactionsListType.list:
                return true;
              case TransactionsListType.calendar:
                return transaction.createdAt.toLocal().getDateOnly().isAtSameMomentAs(selectedDate.getDateOnly());
            }
          })
          .where((transaction) {
            switch (typeFilter) {
              case TransactionsTypeFilter.all:
                return true;
              case TransactionsTypeFilter.incomes:
                return transaction.type == TransactionType.income;
              case TransactionsTypeFilter.expenses:
                return transaction.type == TransactionType.expense;
            }
          })
          .sorted((a, b) {
            switch (dateSort) {
              case TransactionsDateSort.newest:
                return b.createdAt.compareTo(a.createdAt);
              case TransactionsDateSort.oldest:
                return a.createdAt.compareTo(b.createdAt);
            }
          })
          .toList();
}

enum TransactionsListType { list, calendar }

enum TransactionsTypeFilter { all, incomes, expenses }

enum TransactionsDateSort { newest, oldest }
