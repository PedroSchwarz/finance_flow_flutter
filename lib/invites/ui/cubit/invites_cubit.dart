import 'package:finance_flow/groups/groups.dart';
import 'package:finance_flow/invites/invites.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';

part 'invites_cubit.freezed.dart';

class InvitesCubit extends Cubit<InvitesState> {
  InvitesCubit({required this.invitesRepository, required this.groupsRepository})
    : super(const InvitesState(isLoading: false, invites: [], isRefreshing: false));

  static final _log = Logger('InvitesCubit');

  @visibleForTesting
  final InvitesRepository invitesRepository;

  @visibleForTesting
  final GroupsRepository groupsRepository;

  Future<void> load() async {
    emit(state.copyWith(isLoading: true));
    try {
      final invites = await invitesRepository.getInvites(status: InviteStatus.pending.name);
      emit(state.copyWith(invites: invites));
    } catch (e) {
      _log.severe('Error loading invites: $e', e);
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> acceptInvite(InviteResponse invite) async {
    emit(state.copyWith(isRefreshing: true));

    try {
      await invitesRepository.accept(invite.id);
      await groupsRepository.addMemberToGroup(invite.group.id);
    } catch (e) {
      _log.severe('Error accepting invite: $e', e);
    } finally {
      emit(
        state.copyWith(
          invites: state.invites.map((item) => item.id == invite.id ? invite.copyWith(status: InviteStatus.accepted) : item).toList(),
          isRefreshing: false,
        ),
      );
    }
  }

  Future<void> rejectInvite(InviteResponse invite) async {
    emit(state.copyWith(isRefreshing: true));

    try {
      await invitesRepository.reject(invite.id);
    } catch (e) {
      _log.severe('Error rejecting invite: $e', e);
    } finally {
      emit(state.copyWith(invites: state.invites.where((item) => item.id != invite.id).toList(), isRefreshing: false));
    }
  }
}

@freezed
sealed class InvitesState with _$InvitesState {
  const factory InvitesState({required bool isLoading, required List<InviteResponse> invites, required bool isRefreshing}) = _InvitesState;
}
