import 'dart:async';

import 'package:collection/collection.dart';
import 'package:finance_flow/auth/auth.dart';
import 'package:finance_flow/groups/groups.dart';
import 'package:finance_flow/transactions/transactions.dart';
import 'package:finance_flow/users/users.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';

part 'group_details_cubit.freezed.dart';

class GroupDetailsCubit extends Cubit<GroupDetailsState> {
  GroupDetailsCubit({required this.authRepository, required this.usersRepository, required this.groupsRepository})
    : super(
        const GroupDetailsState(
          isLoading: false,
          userBalance: 0,
          showLeaveDialog: false,
          isRefreshing: false,
          depositAmount: 0,
          transactionType: TransactionType.income,
          dateSort: GroupTransactionDateSort.newest,
          shouldGoBack: false,
        ),
      );

  static final _log = Logger('GroupDetailsCubit');

  @visibleForTesting
  final AuthRepository authRepository;

  @visibleForTesting
  final UsersRepository usersRepository;

  @visibleForTesting
  final GroupsRepository groupsRepository;

  UserData get currentUser => authRepository.currentUser.value!;

  Future<void> load({required String groupId}) async {
    emit(state.copyWith(isLoading: true, currentUser: authRepository.currentUser.value));
    await Future.wait([loadGroup(groupId: groupId), loadBalance()]);
    emit(state.copyWith(isLoading: false));
  }

  Future<void> refresh({required String groupId}) async {
    emit(state.copyWith(isRefreshing: true));
    await Future.wait([loadGroup(groupId: groupId), loadBalance()]);
    emit(state.copyWith(isRefreshing: false));
  }

  Future<void> loadGroup({required String groupId}) async {
    try {
      final group = await groupsRepository.getGroupById(groupId);
      emit(state.copyWith(group: group));
    } catch (e) {
      _log.severe('Error loading group: $e', e);
      emit(state.copyWith(shouldGoBack: true));
    }
  }

  Future<void> loadBalance() async {
    try {
      final balance = await usersRepository.getBalance();
      emit(state.copyWith(userBalance: balance));
    } catch (e) {
      _log.severe('Error while loading users balance: $e', e);
    }
  }

  void updateDateSort(GroupTransactionDateSort dateSort) {
    emit(state.copyWith(dateSort: dateSort));
  }

  void toggleLeaveDialog() {
    emit(state.copyWith(showLeaveDialog: !state.showLeaveDialog));
  }

  void updateDepositAmount(double value) {
    emit(state.copyWith(depositAmount: value));
  }

  void updateTransactionType(TransactionType value) {
    emit(state.copyWith(transactionType: value));
  }

  void resetTransactionForm() {
    emit(state.copyWith(depositAmount: 0, transactionType: TransactionType.income));
  }

  void updateSelectedMember(UserResponse member) {
    if (member == state.selectedMember) {
      emit(state.copyWith(selectedMember: null));
      return;
    }

    emit(state.copyWith(selectedMember: member));
  }

  Future<void> leaveGroup() async {
    final group = state.group;

    if (group == null) {
      return;
    }

    emit(state.copyWith(showLeaveDialog: false, isRefreshing: true));

    try {
      await groupsRepository.leaveGroup(group.id);
    } catch (e) {
      _log.severe('Error leaving group: $e', e);
    } finally {
      emit(state.copyWith(isRefreshing: false));
    }
  }

  Future<void> makeTransaction() async {
    final group = state.group;

    if (group == null) {
      return;
    }

    try {
      await groupsRepository.addTransactionToGroup(group.id, CreateGroupTransactionRequest(amount: state.depositAmount, type: state.transactionType));
      await refresh(groupId: group.id);
    } catch (e) {
      _log.severe('Error making transaction: $e', e);
    }
  }
}

@freezed
sealed class GroupDetailsState with _$GroupDetailsState {
  const factory GroupDetailsState({
    required bool isLoading,
    required double userBalance,
    required bool showLeaveDialog,
    required bool isRefreshing,
    required double depositAmount,
    required TransactionType transactionType,
    required GroupTransactionDateSort dateSort,
    required bool shouldGoBack,
    GroupResponse? group,
    UserResponse? selectedMember,
    UserData? currentUser,
  }) = _GroupDetailsState;

  const GroupDetailsState._();

  Set<UserResponse> get assignedUsers => group?.members.where((member) => member.id != currentUser?.id).toSet() ?? {};

  List<String> get assignedUsersIds => assignedUsers.map((user) => user.id).toList();

  List<GroupTransactionResponse> get filteredTransactions =>
      group?.transactions
          .where((transaction) {
            if (selectedMember == null) {
              return true;
            }

            return transaction.owner.id == selectedMember!.id;
          })
          .sorted((a, b) {
            switch (dateSort) {
              case GroupTransactionDateSort.newest:
                return b.createdAt.compareTo(a.createdAt);
              case GroupTransactionDateSort.oldest:
                return a.createdAt.compareTo(b.createdAt);
            }
          })
          .toList() ??
      [];

  double get memberDeposit {
    if (group == null) {
      return 0;
    }

    final filteredTransactions = group!.transactions
        .where((transaction) => transaction.owner.id == currentUser?.id)
        .map((transaction) => transaction.type == TransactionType.expense ? -transaction.amount : transaction.amount);

    if (filteredTransactions.isEmpty) {
      return 0;
    } else {
      return filteredTransactions.reduce((a, b) => a + b);
    }
  }

  double get memberDepositPercentage {
    if (group == null || group!.balance == 0) {
      return 0;
    }

    return memberDeposit / group!.balance;
  }

  bool get canSubmit => switch (transactionType) {
    TransactionType.expense => depositAmount <= memberDeposit,
    TransactionType.income => depositAmount <= userBalance,
  };

  String get formattedMemberDepositPercentage => (memberDepositPercentage * 100).toStringAsFixed(0);
}

enum GroupTransactionDateSort { newest, oldest }
