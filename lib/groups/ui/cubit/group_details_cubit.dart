import 'dart:async';

import 'package:finance_flow/auth/auth.dart';
import 'package:finance_flow/groups/groups.dart';
import 'package:finance_flow/users/data/models/user_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';

part 'group_details_cubit.freezed.dart';

class GroupDetailsCubit extends Cubit<GroupDetailsState> {
  GroupDetailsCubit({required this.authRepository, required this.groupsRepository})
    : super(GroupDetailsState(isLoading: false, selectedDate: DateTime.now(), showLeaveDialog: false, isRefreshing: false, shouldGoBack: false));

  static final _log = Logger('GroupDetailsCubit');

  @visibleForTesting
  final AuthRepository authRepository;

  @visibleForTesting
  final GroupsRepository groupsRepository;

  UserData get currentUser => authRepository.currentUser.value!;

  Future<void> load({required String groupId}) async {
    emit(state.copyWith(isLoading: true, currentUser: authRepository.currentUser.value));
    await Future.wait([loadGroup(groupId: groupId)]);
    emit(state.copyWith(isLoading: false));
  }

  Future<void> refresh({required String groupId}) async {
    emit(state.copyWith(isRefreshing: true));
    await Future.wait([loadGroup(groupId: groupId)]);
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

  void updateSelectedDate(DateTime value) {
    emit(state.copyWith(selectedDate: value));
  }

  void toggleLeaveDialog() {
    emit(state.copyWith(showLeaveDialog: !state.showLeaveDialog));
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
}

@freezed
sealed class GroupDetailsState with _$GroupDetailsState {
  const factory GroupDetailsState({
    required bool isLoading,
    required DateTime selectedDate,
    required bool showLeaveDialog,
    required bool isRefreshing,
    required bool shouldGoBack,
    GroupResponse? group,
    UserData? currentUser,
  }) = _GroupDetailsState;

  const GroupDetailsState._();

  Set<UserResponse> get assignedUsers => group?.members.where((member) => member.id != currentUser?.id).toSet() ?? {};

  List<String> get assignedUsersIds => assignedUsers.map((user) => user.id).toList();
}
