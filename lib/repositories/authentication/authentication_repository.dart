import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_instagram/models/custom_user.dart';

abstract class AuthenticationRepository {
  Future<CustomUser> authenticate();

  Future<UserCredential> signInWithFacebook();
}
