import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import '../../config/paths.dart';
import 'base_auth_repository.dart';

class AuthRepository extends BaseAuthRepository {
  final FirebaseFirestore _firebaseFirestore;
  final auth.FirebaseAuth _firebaseAuth;

  AuthRepository({
    FirebaseFirestore? firebaseFirestore,
    auth.FirebaseAuth? firebaseAuth,
  })  : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance,
        _firebaseAuth = firebaseAuth ?? auth.FirebaseAuth.instance;

  @override
  Stream<auth.User?> get user => _firebaseAuth.userChanges();

  String _verificationId = "";
  int? _token;
  @override
  Future<bool> sendOTP({
    required String phone,
    required verificationFailed,
  }) async {
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (auth.PhoneAuthCredential credential) {},
      verificationFailed: (err) {
        verificationFailed(err);
      },
      codeSent: (String verificationId, int? resendToken) async {
        _verificationId = verificationId;
        _token = resendToken;
      },
      forceResendingToken: _token,
      timeout: const Duration(seconds: 60),
      codeAutoRetrievalTimeout: (_) {},
    );
    return true;
  }

  @override
  Future<auth.UserCredential> verifyOTP({required String otp}) async {
    final credential = auth.PhoneAuthProvider.credential(
        verificationId: _verificationId, smsCode: otp);
    return storeUser(credential: credential);
  }

  @override
  Future<auth.UserCredential> storeUser({required credential}) async {
    final userCredential = await _firebaseAuth.signInWithCredential(credential);
    final doc = await _firebaseFirestore
        .collection(Paths.users)
        .doc(userCredential.user!.uid)
        .get();
    if (!doc.exists) {
      _firebaseFirestore
          .collection(Paths.users)
          .doc(userCredential.user!.uid)
          .set({});
    }
    return userCredential;
  }

  @override
  Future<void> logOut() async {
    await _firebaseAuth.signOut();
  }
}
