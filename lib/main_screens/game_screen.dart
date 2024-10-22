import 'package:chess_flutter/constants/index.dart';
import 'package:chess_flutter/provider/game_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:squares/squares.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  void initState() {
    final GameProvider gameProvider = GameProvider();
    gameProvider.resetGame(newGame: false);
    super.initState();
  }

  void _onMove(Move move) async {
    //   bool result = game.makeSquaresMove(move);
    //   if (result) {
    //     setState(() => state = game.squaresState(player));
    //   }
    //   if (state.state == PlayState.theirTurn && !aiThinking) {
    //     setState(() => aiThinking = true);
    //     await Future.delayed(
    //         Duration(milliseconds: Random().nextInt(4750) + 250));
    //     game.makeRandomMove();
    //     setState(() {
    //       aiThinking = false;
    //       state = game.squaresState(player);
    //     });
    //   }
  }

  @override
  Widget build(BuildContext context) {
    final GameProvider gameProvider = Provider.of<GameProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            RoutingService.goBack(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: white,
          ),
        ),
        backgroundColor: blue,
        centerTitle: true,
        title: Text(
          "Flutter Chess",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w700, color: white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              gameProvider.resetGame(newGame: false);
            },
            icon: Icon(
              Icons.play_circle_outline_outlined,
              color: white,
            ),
          ),
          IconButton(
            onPressed: () {
              gameProvider.flipTheBoard;
            },
            icon: Icon(
              Icons.rotate_left,
              color: white,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          //opponent's data
          ListTile(
            leading: CircleAvatar(
              radius: 25 * Dimensions.widthP(context),
              backgroundImage: AssetImage(Images.aiIcon),
            ),
            title: const Text("User2024"),
            subtitle: const Text("Rating: 700"),
            trailing: Text(
              gameProvider.blacksTime.toString(),
              style: TextStyle(
                  fontWeight: FontWeight.w700, fontSize: 18, color: black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: BoardController(
              state: gameProvider.flipBoard
                  ? gameProvider.state.board.flipped()
                  : gameProvider.state.board,
              playState: gameProvider.state.state,
              pieceSet: PieceSet.merida(),
              theme: BoardTheme.brown,
              moves: gameProvider.state.moves,
              onMove: _onMove,
              onPremove: _onMove,
              markerTheme: MarkerTheme(
                empty: MarkerTheme.dot,
                piece: MarkerTheme.corners(),
              ),
              promotionBehaviour: PromotionBehaviour.autoPremove,
            ),
          ),
          //user's data
          ListTile(
            leading: CircleAvatar(
              radius: 25 * Dimensions.widthP(context),
              backgroundImage: AssetImage(Images.userIcon),
            ),
            title: const Text("User2024"),
            subtitle: const Text("Rating: 700"),
            trailing: Text(
              gameProvider.whitesTime.toString(),
              style: TextStyle(
                  fontWeight: FontWeight.w700, fontSize: 18, color: black),
            ),
          ),
        ],
      ),
    );
  }
}
