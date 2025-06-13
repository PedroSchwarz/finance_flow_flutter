import 'package:finance_flow/auth/auth.dart';
import 'package:finance_flow/groups/groups.dart';
import 'package:finance_flow/invites/invites.dart';
import 'package:finance_flow/users/users.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';

part 'dashboard_cubit.freezed.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit({required this.authRepository, required this.usersRepository, required this.groupsRepository, required this.invitesRepository})
    : super(const DashboardState(isLoading: false, balance: 0.0, groups: [], invites: [], isRefreshing: false));

  static final _log = Logger('DashboardCubit');

  @visibleForTesting
  final AuthRepository authRepository;

  @visibleForTesting
  final UsersRepository usersRepository;

  @visibleForTesting
  final GroupsRepository groupsRepository;

  @visibleForTesting
  final InvitesRepository invitesRepository;

  UserData get currentUser => authRepository.currentUser.value!;

  Future<void> load() async {
    emit(state.copyWith(isLoading: true));
    await Future.wait([loadBalance(), loadGroups(), loadInvites()]);
    emit(state.copyWith(isLoading: false));
  }

  Future<void> loadBalance() async {
    try {
      final balance = await usersRepository.getBalance();
      emit(state.copyWith(balance: balance));
    } catch (e) {
      _log.severe('Error while loading users balance: $e', e);
    }
  }

  Future<void> loadGroups() async {
    try {
      final groups = await groupsRepository.getGroups();
      emit(state.copyWith(groups: groups));
    } catch (e) {
      _log.severe('Error while loading groups: $e', e);
    }
  }

  Future<void> loadInvites() async {
    // try {
    //   final invites = await invitesRepository.getInvites();
    //   emit(state.copyWith(invites: invites));
    // } catch (e) {
    //   _log.severe('Error while loading invites: $e', e);
    // }
  }

  Future<void> refresh() async {
    emit(state.copyWith(isRefreshing: true));
    await Future.wait([loadBalance(), loadGroups(), loadInvites()]);
    emit(state.copyWith(isRefreshing: false));
  }

  Future<void> signOut() async {
    await authRepository.signOut();
  }
}

@freezed
sealed class DashboardState with _$DashboardState {
  const factory DashboardState({
    required bool isLoading,
    required double balance,
    required List<GroupResponse> groups,
    required List<InviteResponse> invites,
    required bool isRefreshing,
  }) = _DashboardState;
}
