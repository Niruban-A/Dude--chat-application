import 'dart:async';

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
  final String clientid =
      "596493783703-5blvnt3egqq5kcrio3ctrbapnqbgnjgs.apps.googleusercontent.com";
  //late final GoogleSignIn? googleSignIn=GoogleSignIn.instance;

  @override
  void initState() {

  }

  Future<void> signInWithGoogle() async {
    try {
      // Trigger the Google Sign-In flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

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
        accessToken: googleAuth.accessToken,
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
  Future<void> signout ()async{
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    setState(() {
      user=null;
    });
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
                if (user == null) {
                  AlertDialog(actions: [Text("Signin failed")]);
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Scaffold(
                        body: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              Text("signin successfull ${user?.email}"),
                              SizedBox(height: 20,),
                              IconButton(onPressed: ()async{
                                await signout();
                                Navigator.pop(context);
                                
                              }, icon: Icon(Icons.back_hand))
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }
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
