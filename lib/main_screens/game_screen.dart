import 'dart:math';
import 'package:bishop/bishop.dart' as bishop;
import 'package:chess_flutter/constants/index.dart';
import 'package:flutter/material.dart';
import 'package:square_bishop/square_bishop.dart';
import 'package:squares/squares.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late bishop.Game game;
  late SquaresState state;
  int player = Squares.white;
  bool aiThinking = false;
  bool flipBoard = false;

  @override
  void initState() {
    _resetGame(false);
    super.initState();
  }

  void _resetGame([bool ss = true]) {
    game = bishop.Game(variant: bishop.Variant.standard());
    state = game.squaresState(player);
    if (ss) setState(() {});
  }

  void _flipBoard() => setState(() => flipBoard = !flipBoard);

  void _onMove(Move move) async {
    bool result = game.makeSquaresMove(move);
    if (result) {
      setState(() => state = game.squaresState(player));
    }
    if (state.state == PlayState.theirTurn && !aiThinking) {
      setState(() => aiThinking = true);
      await Future.delayed(
          Duration(milliseconds: Random().nextInt(4750) + 250));
      game.makeRandomMove();
      setState(() {
        aiThinking = false;
        state = game.squaresState(player);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
            onPressed: _resetGame,
            icon: Icon(
              Icons.play_circle_outline_outlined,
              color: white,
            ),
          ),
          IconButton(
            onPressed: _flipBoard,
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
            trailing: const Text("10:00"),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: BoardController(
              state: flipBoard ? state.board.flipped() : state.board,
              playState: state.state,
              pieceSet: PieceSet.merida(),
              theme: BoardTheme.brown,
              moves: state.moves,
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
            trailing: const Text("10:00"),
          ),
        ],
      ),
    );
  }
}
