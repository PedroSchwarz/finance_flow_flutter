import 'package:finance_flow/invites/invites.dart';
import 'package:flutter/foundation.dart';

class InvitesRepository {
  const InvitesRepository({required this.invitesRemoteDataSource});

  @visibleForTesting
  final InvitesRemoteDataSource invitesRemoteDataSource;

  Future<List<InviteResponse>> getInvites({String status = 'all'}) async {
    return await invitesRemoteDataSource.fetchAll(status);
  }

  Future<void> create({required String userId, required String groupId}) async {
    return await invitesRemoteDataSource.create(CreateInviteRequest(to: userId, groupId: groupId));
  }

  Future<void> accept(String id) async {
    return await invitesRemoteDataSource.accept(id);
  }

  Future<void> reject(String id) async {
    return await invitesRemoteDataSource.reject(id);
  }
}
