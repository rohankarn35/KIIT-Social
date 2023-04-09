import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  String? get emailtext => null;

  Future<bool> signInWithGoogle() async {
     GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
     GoogleSignInAuthentication gAUth = await gUser!.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: gAUth.accessToken, idToken: gAUth.idToken);
  // UserCredential users = await FirebaseAuth.instance.signInWithCredential(credential);
  //  String? emailtext =users.user?.email;

  // GoogleSignIn signIn  = GoogleSignIn();
  if(gUser.email.contains("@kiit.ac.in")){
    await FirebaseAuth.instance.signInWithCredential(credential);
    return true;
  }else{
    return false;
  }


    // return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
