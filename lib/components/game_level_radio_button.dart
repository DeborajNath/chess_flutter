import 'package:chess_flutter/constants/index.dart';
import 'package:flutter/material.dart';

class GameLevelRadioButton extends StatelessWidget {
  const GameLevelRadioButton({
    super.key,
    required this.title,
    required this.value,
    this.groupValue,
    required this.onChanged,
  });
  final String title;
  final GameDifficulty value;
  final GameDifficulty? groupValue;
  final Function(GameDifficulty?)? onChanged;
  @override
  Widget build(BuildContext context) {
    final capitalizedTitle = title[0].toUpperCase() + title.substring(1);
    return Expanded(
      child: RadioListTile<GameDifficulty>(
        title: Text(
          capitalizedTitle,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14 * Dimensions.heightF(context),
          ),
        ),
        value: value,
        dense: true,
        tileColor: lightGrey,
        contentPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10 * Dimensions.heightF(context),
          ),
        ),
        groupValue: groupValue,
        onChanged: onChanged,
      ),
    );
  }
}
