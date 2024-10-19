import 'dart:developer';

import 'package:chess_flutter/components/custom_list_tile.dart';
import 'package:chess_flutter/constants/index.dart';
import 'package:chess_flutter/helper/helper_methods.dart';
import 'package:flutter/material.dart';

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
        body: ListView.builder(
          itemCount: gameTimes.length,
          itemBuilder: (context, index) {
            final String label = gameTimes[index].split(' ')[0];
            final String gameTime = gameTimes[index].split(' ')[1];
            return CustomListTile(
                title: "$label $gameTime",
                onTap: () {
                  log("selected game: ${gameTimes[index]}");
                });
          },
        ));
  }
}
