import 'package:chat_application/tools.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:async/async.dart' show unawaited;

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  User? user;
  final String clientid="596493783703-5blvnt3egqq5kcrio3ctrbapnqbgnjgs.apps.googleusercontent.com";
  final GoogleSignIn googleSignIn = GoogleSignIn.instance;
  final GoogleSignIn signIn = GoogleSignIn.instance;
  
  // unawaited(
  // signIn.initialize(clientId: clientId, serverClientId: serverClientId).then((
  // _,
  // ) {
  // signIn.authenticationEvents
  // .listen(_handleAuthenticationEvent)
  // .onError(_handleAuthenticationError);

  // /// This example always uses the stream-based approach to determining
  // /// which UI state to show, rather than using the future returned here,
  // /// if any, to conditionally skip directly to the signed-in state.
  // signIn.attemptLightweightAuthentication();
  // }),
  // );
  @override
  void initState() {
    super.initState();
  }

  Future<void> signInWithGoogle() async {
    try {
      // Trigger the Google Sign-In flow
      final GoogleSignInAccount? googleUser = await googleSignIn.authenticate();

      if (googleUser == null) {
        // User canceled the sign-in
        return;
      }

      // Obtain the auth details
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a credential for Firebase
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      ); // Sign in to Firebase
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(credential);

      setState(() {
        user = userCredential.user;
      });
    } catch (e) {
      print("Sign in failed: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGreen,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/rob_icon.png",
              width: 300,
              height: 300,
              colorBlendMode: BlendMode.overlay,
              color: AppColors.lightGreen.withOpacity(0.5),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                await signInWithGoogle();
              },
              style: OutlinedButton.styleFrom(foregroundColor: Colors.red),
              child: Text(
                "Sign in with google",
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  fontSize: 5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
