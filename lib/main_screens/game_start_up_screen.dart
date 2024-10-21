import 'package:chess_flutter/components/player_color_radio_button.dart';
import 'package:chess_flutter/constants/index.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.remove),
                          ),
                          Container(
                            height: 40 * Dimensions.heightF(context),
                            width: 60 * Dimensions.widthP(context),
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                "1",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.add),
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
                            widget.gameTime ?? "0",
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
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.remove),
                          ),
                          Container(
                            height: 40 * Dimensions.heightF(context),
                            width: 60 * Dimensions.widthP(context),
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                "1",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.add),
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
                            widget.gameTime ?? "0",
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
