import 'package:finance_flow/auth/auth.dart';
import 'package:finance_flow/groups/groups.dart';
import 'package:finance_flow/invites/invites.dart';
import 'package:finance_flow/transactions/transactions.dart';
import 'package:finance_flow/users/users.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';

part 'create_group_cubit.freezed.dart';

class CreateGroupCubit extends Cubit<CreateGroupState> {
  CreateGroupCubit({required this.authRepository, required this.usersRepository, required this.groupsRepository, required this.invitesRepository})
    : super(
        const CreateGroupState(
          maxBalance: 0,
          users: [],
          selectedUsersIds: [],
          name: '',
          description: '',
          amount: 0,
          showInviteUsersSheet: false,
          isLoading: false,
          isSubmitting: false,
          showDeleteDialog: false,
          shouldGoBack: false,
        ),
      );

  static final _log = Logger('CreateGroupCubit');

  @visibleForTesting
  final AuthRepository authRepository;

  @visibleForTesting
  final UsersRepository usersRepository;

  @visibleForTesting
  final GroupsRepository groupsRepository;

  @visibleForTesting
  final InvitesRepository invitesRepository;

  UserData get currentUser => authRepository.currentUser.value!;

  Future<void> load(String? id) async {
    await Future.wait([loadUsers(), if (id == null) loadBalance(), if (id != null) loadGroup(id)]);
  }

  Future<void> loadBalance() async {
    try {
      final balance = await usersRepository.getBalance();
      emit(state.copyWith(maxBalance: balance));
    } catch (e) {
      _log.severe('Error while loading users balance: $e', e);
    }
  }

  Future<void> loadUsers() async {
    try {
      final users = await usersRepository.getUsers();
      emit(state.copyWith(users: users));
    } catch (e) {
      _log.severe('Error loading users: $e', e);
    }
  }

  Future<void> loadGroup(String id) async {
    emit(state.copyWith(isLoading: true));

    try {
      final group = await groupsRepository.getGroupById(id);
      emit(
        state.copyWith(
          group: group,
          name: group.name,
          description: group.description,
          selectedUsersIds: group.members.where((member) => member.id != currentUser.id).map((member) => member.id).toList(),
        ),
      );
    } catch (e) {
      _log.severe('Error loading group: $e', e);
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  void updateName(String name) {
    emit(state.copyWith(name: name));
  }

  void updateDescription(String description) {
    emit(state.copyWith(description: description));
  }

  void updateAmount(double amount) {
    emit(state.copyWith(amount: amount));
  }

  void toggleInviteUsersSheet() {
    emit(state.copyWith(showInviteUsersSheet: !state.showInviteUsersSheet));
  }

  void updateSelectedUsersIds(List<String> selectedUsersIds) {
    emit(state.copyWith(selectedUsersIds: selectedUsersIds));
  }

  Future<void> saveGroup() async {
    emit(state.copyWith(isSubmitting: true));

    if (state.isUpdating) {
      await updateGroup();
    } else {
      await createGroup();
    }

    emit(state.copyWith(isSubmitting: false));
  }

  Future<void> createGroup() async {
    try {
      final groupId = await groupsRepository.createGroup(name: state.name, description: state.description);

      await Future.wait([
        for (final id in state.selectedUsersIds) invitesRepository.create(groupId: groupId, userId: id),
        if (state.amount > 0)
          groupsRepository.addTransactionToGroup(groupId, CreateGroupTransactionRequest(amount: state.amount, type: TransactionType.income)),
      ]);

      emit(state.copyWith(shouldGoBack: true));
    } catch (e) {
      _log.severe('Error creating group: $e', e);
    }
  }

  Future<void> updateGroup() async {
    final group = state.group;

    if (group == null) {
      emit(state.copyWith(isSubmitting: false));
      return;
    }

    final String ownerId = group.owner.id;
    final Set<String> selectedUserIds = state.selectedUsersIds.toSet();
    final Set<String> currentMemberIds = group.members.map((member) => member.id).toSet();

    try {
      final List<String> updatedMemberIds = [ownerId, ...selectedUserIds.intersection(currentMemberIds)];

      await groupsRepository.updateGroup(
        id: group.id,
        UpdateGroupRequest(name: state.name, description: state.description, members: updatedMemberIds),
      );

      final List<String> usersToInvite = selectedUserIds.difference(currentMemberIds).toList();

      await Future.wait([for (final id in usersToInvite) invitesRepository.create(groupId: group.id, userId: id)]);

      emit(state.copyWith(shouldGoBack: true));
    } catch (e) {
      _log.severe('Error updating group: $e', e);
    }
  }

  void toggleDeleteDialog() {
    emit(state.copyWith(showDeleteDialog: !state.showDeleteDialog));
  }

  Future<void> deleteGroup() async {
    final group = state.group;

    if (group == null) {
      return;
    }

    emit(state.copyWith(showDeleteDialog: false, isSubmitting: true));

    try {
      await groupsRepository.deleteGroup(group.id);
      emit(state.copyWith(shouldGoBack: true));
    } catch (e) {
      _log.severe('Error deleting group: $e', e);
    } finally {
      emit(state.copyWith(isSubmitting: false));
    }
  }
}

@freezed
sealed class CreateGroupState with _$CreateGroupState {
  const factory CreateGroupState({
    required double maxBalance,
    required List<UserResponse> users,
    required List<String> selectedUsersIds,
    required String name,
    required String description,
    required double amount,
    required bool showInviteUsersSheet,
    required bool isLoading,
    required bool isSubmitting,
    required bool showDeleteDialog,
    required bool shouldGoBack,
    GroupResponse? group,
  }) = _CreateGroupState;

  const CreateGroupState._();

  bool get isUpdating => group != null;

  bool get isAmountValid => maxBalance.isNegative ? amount == 0 : amount <= maxBalance;

  bool get isFormValid => name.isNotEmpty && isAmountValid;

  bool get canSubmit => isFormValid && !isLoading && !isSubmitting;
}
