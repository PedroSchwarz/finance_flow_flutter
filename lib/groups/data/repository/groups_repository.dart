import 'package:finance_flow/groups/groups.dart';
import 'package:flutter/foundation.dart';

class GroupsRepository {
  const GroupsRepository({required this.groupsRemoteDataSource});

  @visibleForTesting
  final GroupsRemoteDataSource groupsRemoteDataSource;

  Future<List<GroupResponse>> getGroups() async {
    return groupsRemoteDataSource.fetchAll();
  }

  Future<GroupResponse> getGroupById(String id) async {
    return groupsRemoteDataSource.fetchById(id);
  }

  Future<String> createGroup({required String name, required String description}) async {
    return groupsRemoteDataSource.create(CreateGroupRequest(name: name, description: description));
  }

  Future<void> addTransactionToGroup(String id, CreateGroupTransactionRequest request) async {
    return groupsRemoteDataSource.addTransaction(id, request);
  }

  Future<void> addMemberToGroup(String id) async {
    return groupsRemoteDataSource.addMember(id);
  }

  Future<void> leaveGroup(String id) async {
    return groupsRemoteDataSource.leave(id);
  }

  Future<void> updateGroup(UpdateGroupRequest request, {required String id}) async {
    return groupsRemoteDataSource.update(id, request);
  }

  Future<void> deleteGroup(String id) async {
    return groupsRemoteDataSource.delete(id);
  }
}
