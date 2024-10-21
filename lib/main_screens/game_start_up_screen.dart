import 'package:chess_flutter/constants/index.dart';
import 'package:flutter/material.dart';

class GameStartUpScreen extends StatefulWidget {
  const GameStartUpScreen(
      {super.key, required this.isCustomedTime, this.gameTime});
  final bool isCustomedTime;
  final String? gameTime;

  @override
  State<GameStartUpScreen> createState() => _GameStartUpScreenState();
}

class _GameStartUpScreenState extends State<GameStartUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: blue,
        centerTitle: true,
        title: Text(
          "Setup your Game",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w700, color: white),
        ),
      ),
    );
  }
}
