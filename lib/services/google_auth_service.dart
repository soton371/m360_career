import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService {
  static Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await GoogleSignIn().signIn();

      final email = googleSignInAccount?.email;
      print("message email: $email");
    } catch (e) {
      print("error message signInWithGoogle: $e");
    }
  }
}
