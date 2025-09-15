import 'package:chat_application/tools.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    
  );
  runApp(const Chatapp());
}

class Chatapp extends StatefulWidget {
  const Chatapp({super.key});

  @override
  State<Chatapp> createState() => _ChatappState();
}

class _ChatappState extends State<Chatapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: AppColors.darkBlue,
        buttonTheme: ButtonThemeData(textTheme:ButtonTextTheme.primary),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: AppColors.darkBlue),
          bodyMedium: TextStyle(color: AppColors.darkBlue),
          bodySmall: TextStyle(color: AppColors.darkBlue),
        ),
      ),
      home: Loginpage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
