import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../config/paths.dart';
import '../../model/user_model.dart'as us;
import 'base_user_repository.dart';

class UserRepository extends BaseUserRepository {
  final FirebaseFirestore _firebaseFirestore;

  UserRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;


  @override
  void followUser(
      {required String userId,
      required String followUserId,
      required String requestId}) {
    // TODO: implement followUser
  }

  @override
  Future<List<User>> getUsersByFollowers(String userId) {
    // TODO: implement getUsersByFollowers
    throw UnimplementedError();
  }

  @override
  Future<bool> isFollowing(
      {required String userId, required String otherUserId}) {
    // TODO: implement isFollowing
    throw UnimplementedError();
  }

  @override
  Future<bool> isRequesting(
      {required String userId, required String otherUserId}) {
    // TODO: implement isRequesting
    throw UnimplementedError();
  }

  @override
  Future<bool> searchUserbyPhone(
      {required String query, required bool newAccount}) {
    // TODO: implement searchUserbyPhone
    throw UnimplementedError();
  }

  @override
  Future<bool> searchUserbyUsername({required String query}) {
    // TODO: implement searchUserbyUsername
    throw UnimplementedError();
  }

  @override
  Future<List<User>> searchUsers({required String query}) {
    // TODO: implement searchUsers
    throw UnimplementedError();
  }

  @override
  Future<void> setUser({required us.User user}) async {
    await _firebaseFirestore
        .collection(Paths.users)
        .doc(user.id)
        .set(user.toDocument());
  }

  @override
  void unfollowUser({required String userId, required String unfollowUserId}) {
    // TODO: implement unfollowUser
  }

  @override
  Future<void> updateUser({required us.User user}) async {
    await _firebaseFirestore
        .collection(Paths.users)
        .doc(user.id)
        .update(user.toDocument());
  }
  
  @override
  Future<us.User> getUserWithId({required String userId})async {
    final doc =
        await _firebaseFirestore.collection(Paths.users).doc(userId).get();
    return doc.exists ? us.User.fromDocument(doc) : us.User.empty;
  }
}
