import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  signInWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication gAUth = await gUser!.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: gAUth.accessToken, idToken: gAUth.idToken);
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
