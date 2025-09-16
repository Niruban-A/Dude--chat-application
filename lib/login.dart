import 'package:chat_application/tools.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
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
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.red,
              ),
              child: Text("Sign in with google" ,style:GoogleFonts.lato(fontWeight: FontWeight.bold) ,),
            ),
          ],
        ),
      ),
    );
  }
}
