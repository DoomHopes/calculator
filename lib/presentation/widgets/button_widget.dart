import 'package:calculator/presentation/utils/colors.dart';
import 'package:calculator/presentation/utils/utils.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = getTextColor(text);
    final double fontSize = Utils.isOperator(text, hasEquals: true) ? 26 : 22;
    final style = TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
    );

    return Expanded(
      child: Container(
        height: double.infinity,
        margin: const EdgeInsets.all(6),
        child: ElevatedButton(
          onPressed: onClicked,
          style: ElevatedButton.styleFrom(
            primary: MyColors.backgroung1,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: text == '<'
              ? Icon(Icons.backspace_outlined, color: color)
              : Text(text, style: style),
        ),
      ),
    );
  }

  Color getTextColor(String buttonText) {
    switch (buttonText) {
      case '+':
      case '-':
      case '*':
      case '/':
      case '=':
      case '%':
      case '(':
      case ')':
        return MyColors.buttonIconColor2;
      case 'AC':
      case '<':
        return MyColors.buttonIconColor2;
      default:
        return MyColors.buttonIconColor1;
    }
  }
}
