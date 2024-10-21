import 'package:chess_flutter/constants/index.dart';
import 'package:flutter/material.dart';

class PlayerColorRadioButton extends StatelessWidget {
  const PlayerColorRadioButton({
    super.key,
    required this.title,
    required this.value,
    this.groupValue,
    required this.onChanged,
  });
  final String title;
  final PlayerColor value;
  final PlayerColor? groupValue;
  final Function(PlayerColor?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200 * Dimensions.widthP(context),
      child: RadioListTile<PlayerColor>(
        title: Text(
          title,
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
