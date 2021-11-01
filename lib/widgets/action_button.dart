import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function function;
  final double height;
  final double width;

  const ActionButton({
    Key? key,
    required this.text,
    required this.color,
    required this.function,
    this.height = 40,
    this.width = 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: null,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: color,
        ),
        child: Center(child: Text(text)),
      ),
    );
  }
}
