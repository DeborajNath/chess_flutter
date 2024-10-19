import 'package:chess_flutter/components/index.dart';
import 'package:chess_flutter/constants/index.dart';
import 'package:chess_flutter/main_screens/index.dart';
import 'package:chess_flutter/main_screens/two_players.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: blue,
        centerTitle: true,
        title: Text(
          "Flutter Chess",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w700, color: white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(
          20 * Dimensions.heightF(context),
        ),
        child: Column(
          children: [
            CustomListTile(
              onTap: () {
                RoutingService.goto(
                  context,
                  const GameScreen(),
                );
              },
              title: "Play against computer",
              customIcon: Icon(
                Icons.computer,
                size: 50 * Dimensions.heightF(context),
              ),
            ),
            const Gap(20),
            CustomListTile(
              onTap: () {
                RoutingService.goto(
                  context,
                  const GameTimeScreen(),
                );
              },
              title: "Play online",
              customIcon: Icon(
                Icons.online_prediction_outlined,
                size: 50 * Dimensions.heightF(context),
              ),
            ),
            const Gap(20),
            CustomListTile(
              onTap: () {
                RoutingService.goto(
                  context,
                  const TwoPlayersScreen(),
                );
              },
              title: "Play offline(2 players)",
              customIcon: Icon(
                Icons.people_alt,
                size: 50 * Dimensions.heightF(context),
              ),
            ),
            const Gap(20),
            CustomListTile(
              onTap: () {
                RoutingService.goto(
                  context,
                  const SettingScreen(),
                );
              },
              title: "Settings",
              customIcon: Icon(
                Icons.settings,
                size: 50 * Dimensions.heightF(context),
              ),
            ),
            const Gap(20),
            CustomListTile(
              onTap: () {
                RoutingService.goto(
                  context,
                  const AboutScreen(),
                );
              },
              title: "About",
              customIcon: Icon(
                Icons.info,
                size: 50 * Dimensions.heightF(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
