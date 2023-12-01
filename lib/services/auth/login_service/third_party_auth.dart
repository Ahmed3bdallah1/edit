import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ThirdPartyAuth {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  // User get currentUser => _auth.currentUser!;

  Future<void> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        final AccessToken accessToken = result.accessToken!;

        final String token = accessToken.token;

        final OAuthCredential credential =
        FacebookAuthProvider.credential(token);

        final UserCredential userCredential =

        await FirebaseAuth.instance.signInWithCredential(credential);

        final User? user = userCredential.user;

        if (user != null) {
          await firestore
              .collection("users")
              .doc(userCredential.user!.uid)
              .set({
            "uid": user.uid,
            "email": user.email,
            "username": user.displayName
          });
        } else {
          print("there is no users");
        }
      } else {
        print("failed to login");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
        final String idToken = googleAuth.idToken!;
        final String accessToken = googleAuth.accessToken!;

        final OAuthCredential credential = GoogleAuthProvider.credential(
          idToken: idToken,
          accessToken: accessToken,
        );
        final UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

        final User? user = userCredential.user;
        if (user != null) {
          await firestore
              .collection("users")
              .doc(userCredential.user!.uid)
              .set({
            "uid": user.uid,
            "email": user.email,
            "username": user.displayName
          });
        } else {
          print("there is no users");
        }
      }else{
        print("failed to login");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}