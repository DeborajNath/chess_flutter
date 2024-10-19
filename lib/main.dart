import 'package:chess_flutter/provider/game_provider.dart';
import 'package:chess_flutter/provider/two_players_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chess_flutter/main_screens/splash_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => GameProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) => TwoPlayersGame(),
    ),
  ], child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
