import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:my_instagram/models/custom_user.dart';
import 'package:my_instagram/repositories/authentication/authentication_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  @override
  Future<CustomUser> authenticate() async {
    try {
      return await _getUserData();
    } catch (e) {
      return null;
    }
  }

  @override
  Future<UserCredential> signInWithFacebook() async {
    try {
      final AccessToken accessToken = await FacebookAuth.instance.login();
      final FacebookAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(accessToken.token);
      final UserCredential _userCredential = await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

      await _setUserData(userCredential: _userCredential);

      return _userCredential;
    } catch (e) {
      return null;
    }
  }

  Future<void> _setUserData({UserCredential userCredential}) async {
    final SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
    await _sharedPreferences.setString('uid', userCredential.user.uid);
    await _sharedPreferences.setString('userName', userCredential.user.displayName);
  }

  Future<CustomUser> _getUserData() async {
    final SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
    final CustomUser _customUser = CustomUser();
    _customUser.id = _sharedPreferences.getString('uid');
    _customUser.userName = _sharedPreferences.getString('userName');
    return _customUser;
  }
}
