import 'dart:developer';

import 'package:chess_flutter/components/index.dart';
import 'package:chess_flutter/constants/index.dart';
import 'package:chess_flutter/helper/helper_methods.dart';
import 'package:chess_flutter/main_screens/index.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class GameTimeScreen extends StatefulWidget {
  const GameTimeScreen({super.key});

  @override
  State<GameTimeScreen> createState() => _GameTimeScreenState();
}

class _GameTimeScreenState extends State<GameTimeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          "Setup Game Time",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w700, color: white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: gameTimes.length,
          itemBuilder: (context, index) {
            final String label = gameTimes[index].split(' ')[0];
            final String gameTime = gameTimes[index].split(' ')[1];
            return Column(
              children: [
                CustomListTile(
                  title: label,
                  subtitle: Text(gameTime),
                  onTap: () {
                    if (label == "Custom") {
                      RoutingService.goto(
                        context,
                        GameStartUpScreen(
                          isCustomedTime: true,
                          gameTime: gameTime,
                        ),
                      );
                    } else {
                      RoutingService.goto(
                        context,
                        GameStartUpScreen(
                          isCustomedTime: false,
                          gameTime: gameTime,
                        ),
                      );
                    }
                    log("selected game: ${gameTimes[index]}");
                  },
                  customIcon: Icon(
                    Icons.gamepad,
                    size: 30,
                    color: black,
                  ),
                ),
                const Gap(20),
              ],
            );
          },
        ),
      ),
    );
  }
}
