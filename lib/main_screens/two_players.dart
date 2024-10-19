import 'package:chess_flutter/constants/index.dart';
import 'package:chess_flutter/provider/two_players_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:squares/squares.dart';

class TwoPlayersScreen extends StatefulWidget {
  const TwoPlayersScreen({super.key});

  @override
  State<TwoPlayersScreen> createState() => _TwoPlayersScreenState();
}

class _TwoPlayersScreenState extends State<TwoPlayersScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final gameProvider = Provider.of<TwoPlayersGame>(context, listen: false);
      gameProvider.resetGame();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<TwoPlayersGame>(context);

    return WillPopScope(
      onWillPop: () async {
        return await _showExitDialog(context);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: blue,
          centerTitle: true,
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          title: Text(
            "Pass and Play",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.w700, color: white),
          ),
          actions: [
            IconButton(
              onPressed: () {
                gameProvider.resetGame();
                gameProvider
                    .startTimer(context); // Start the timer after resetting
              },
              icon: Icon(Icons.play_circle_outline_outlined, color: white),
            ),
            IconButton(
              onPressed: gameProvider.flipBoardState,
              icon: Icon(Icons.rotate_left, color: white),
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildPlayerTime("Player 2 (Black)", gameProvider.blackTime),
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
                onMove: (move) {
                  gameProvider.makeMove(move, context);
                  // Optionally check if the game is over here
                },
              ),
            ),
            _buildPlayerTime("Player 1 (White)", gameProvider.whiteTime),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayerTime(String playerName, Duration time) {
    return ListTile(
      title: Text(
        playerName,
        style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
      ),
      trailing: Text(
        "${time.inMinutes}:${(time.inSeconds % 60).toString().padLeft(2, '0')}",
        style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
      ),
    );
  }

  Future<bool> _showExitDialog(BuildContext context) async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Do you really want to exit?"),
            content: const Text("Your ongoing game will be dismissed"),
            actions: [
              TextButton(
                onPressed: () =>
                    RoutingService.goBack(context), // Stay on the screen
                child: const Text("No"),
              ),
              TextButton(
                onPressed: () {
                  final gameProvider =
                      Provider.of<TwoPlayersGame>(context, listen: false);
                  gameProvider
                      .disposeTimers(); // Dispose timers or other resources
                  Navigator.of(context).pop(true); // Exit the screen
                },
                child: const Text("Yes"),
              ),
            ],
          ),
        ) ??
        false; // Default to false if dialog is dismissed
  }
}
