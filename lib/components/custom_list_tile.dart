// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomListTile extends StatefulWidget {
  final String title;

  final Icon? customIcon;
  final void Function() onTap;

  const CustomListTile({
    super.key,
    required this.title,
    this.customIcon,
    required this.onTap,
  });

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(),
          gradient: const LinearGradient(
            colors: [
              Colors.blue,
              Colors.white,
            ],
          ),
        ),
        child: ListTile(
            contentPadding: const EdgeInsets.all(10),
            title: Text(
              widget.title,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            trailing: const Icon(Icons.keyboard_double_arrow_right_rounded),
            leading: widget.customIcon),
      ),
    );
  }
}
