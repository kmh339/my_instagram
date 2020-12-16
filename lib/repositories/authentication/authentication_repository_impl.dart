import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:my_instagram/repositories/authentication/authentication_repository.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  @override
  Future<UserCredential> signInWithFacebook() async {
    final AccessToken accessToken = await FacebookAuth.instance.login();

    final FacebookAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(accessToken.token);

    return await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
}
