import 'package:chess_flutter/components/index.dart';
import 'package:chess_flutter/constants/index.dart';
import 'package:chess_flutter/helper/helper_methods.dart';
import 'package:chess_flutter/main_screens/index.dart';
import 'package:chess_flutter/provider/game_provider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class GameStartUpScreen extends StatefulWidget {
  const GameStartUpScreen(
      {super.key, required this.isCustomedTime, required this.gameTime});
  final bool isCustomedTime;
  final String? gameTime;

  @override
  State<GameStartUpScreen> createState() => _GameStartUpScreenState();
}

class _GameStartUpScreenState extends State<GameStartUpScreen> {
  PlayerColor playerColorGroup = PlayerColor.white;
  GameDifficulty gameDifficultyGroup = GameDifficulty.easy;
  int whiteTimeInMinutes = 0;
  int blackTimeInMinutes = 0;
  @override
  Widget build(BuildContext context) {
    final GameProvider gameProvider = Provider.of<GameProvider>(context);

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
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PlayerColorRadioButton(
                  title: "Play as ${PlayerColor.white.name}",
                  value: PlayerColor.white,
                  groupValue: playerColorGroup,
                  onChanged: (value) {
                    setState(() {
                      playerColorGroup = value!;
                    });
                  },
                ),
                widget.isCustomedTime
                    ? Row(
                        children: [
                          Container(
                            height: 40 * Dimensions.heightF(context),
                            width: 50 * Dimensions.widthP(context),
                            decoration: BoxDecoration(
                                color: whiteTimeInMinutes == 0 ? grey : blue,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all()),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  whiteTimeInMinutes == 0
                                      ? () {}
                                      : whiteTimeInMinutes--;
                                });
                              },
                              icon: Icon(
                                Icons.remove,
                                size: 20,
                                color: white,
                              ),
                            ),
                          ),
                          const Gap(5),
                          Container(
                            height: 40 * Dimensions.heightF(context),
                            width: 50 * Dimensions.widthP(context),
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                whiteTimeInMinutes.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          const Gap(5),
                          Container(
                            height: 40 * Dimensions.heightF(context),
                            width: 50 * Dimensions.widthP(context),
                            decoration: BoxDecoration(
                                color: blue,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all()),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  whiteTimeInMinutes++;
                                });
                              },
                              icon: Icon(
                                Icons.add,
                                size: 20,
                                color: white,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Container(
                        height: 40 * Dimensions.heightF(context),
                        width: 60 * Dimensions.widthP(context),
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            widget.gameTime!,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
              ],
            ),
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PlayerColorRadioButton(
                  title: "Play as ${PlayerColor.black.name}",
                  value: PlayerColor.black,
                  groupValue: playerColorGroup,
                  onChanged: (value) {
                    setState(() {
                      playerColorGroup = value!;
                    });
                  },
                ),
                widget.isCustomedTime
                    ? Row(
                        children: [
                          Container(
                            height: 40 * Dimensions.heightF(context),
                            width: 50 * Dimensions.widthP(context),
                            decoration: BoxDecoration(
                                color: whiteTimeInMinutes == 0 ? grey : blue,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all()),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  blackTimeInMinutes == 0
                                      ? () {}
                                      : blackTimeInMinutes--;
                                });
                              },
                              icon: Icon(
                                Icons.remove,
                                size: 20,
                                color: white,
                              ),
                            ),
                          ),
                          const Gap(5),
                          Container(
                            height: 40 * Dimensions.heightF(context),
                            width: 50 * Dimensions.widthP(context),
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                blackTimeInMinutes.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          const Gap(5),
                          Container(
                            height: 40 * Dimensions.heightF(context),
                            width: 50 * Dimensions.widthP(context),
                            decoration: BoxDecoration(
                                color: blue,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all()),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  blackTimeInMinutes++;
                                });
                              },
                              icon: Icon(
                                Icons.add,
                                size: 20,
                                color: white,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Container(
                        height: 40 * Dimensions.heightF(context),
                        width: 60 * Dimensions.widthP(context),
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            widget.gameTime!,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
              ],
            ),
            const Gap(20),
            gameProvider.vsComputer
                ? Column(
                    children: [
                      const Text(
                        "Game Difficulty",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GameLevelRadioButton(
                            title: GameDifficulty.easy.name,
                            value: GameDifficulty.easy,
                            groupValue: gameDifficultyGroup,
                            onChanged: (value) {
                              setState(() {
                                gameDifficultyGroup = value!;
                              });
                            },
                          ),
                          const Gap(10),
                          GameLevelRadioButton(
                            title: GameDifficulty.medium.name,
                            value: GameDifficulty.medium,
                            groupValue: gameDifficultyGroup,
                            onChanged: (value) {
                              setState(() {
                                gameDifficultyGroup = value!;
                              });
                            },
                          ),
                          const Gap(10),
                          GameLevelRadioButton(
                            title: GameDifficulty.hard.name,
                            value: GameDifficulty.hard,
                            groupValue: gameDifficultyGroup,
                            onChanged: (value) {
                              setState(() {
                                gameDifficultyGroup = value!;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
            const Gap(20),
            ElevatedButton(
              onPressed: () {
                playGame(gameProvider: gameProvider);
              },
              child: const Text("Play"),
            ),
          ],
        ),
      ),
    );
  }

  void playGame({
    required GameProvider gameProvider,
  }) {
    if (widget.isCustomedTime) {
      if (whiteTimeInMinutes <= 0 || blackTimeInMinutes <= 0) {
        showSnackbar(context: context, content: "Time Cannot be zero");
        return;
      }
    }
    RoutingService.goto(
      context,
      const GameScreen(),
    );
  }
}
