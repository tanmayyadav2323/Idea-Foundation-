import 'package:firebase_auth/firebase_auth.dart';
import '../../model/user_model.dart' as us;

abstract class BaseUserRepository {
  Future<us.User> getUserWithId({required String userId});
  Future<void> updateUser({required User user});
  Future<void> setUser({required us.User user});
  Future<List<User>> searchUsers({required String query});
  Future<List<User>> getUsersByFollowers(String userId);

  void followUser({
    required String userId,
    required String followUserId,
    required String requestId,
  });
  void unfollowUser({required String userId, required String unfollowUserId});
  Future<bool> searchUserbyPhone(
      {required String query, required bool newAccount});
  Future<bool> searchUserbyUsername({required String query});
  Future<bool> isFollowing({
    required String userId,
    required String otherUserId,
  });

  Future<bool> isRequesting({
    required String userId,
    required String otherUserId,
  });
}
