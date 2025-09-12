import 'package:flutter/material.dart';
import 'home.dart';

void main() {
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
    return MaterialApp(theme: ThemeData.dark(), home: HomePage(),debugShowCheckedModeBanner: false,);
  }
}
