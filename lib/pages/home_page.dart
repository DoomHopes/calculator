import 'package:calculator/utils/colors.dart';
import 'package:calculator/widgets/button_widget.dart';
import 'package:calculator/widgets/result_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(child: ResultWidget()),
            Expanded(child: buildButtons(), flex: 2),
          ],
        ),
      ),
    );
  }
}

Widget buildButtons() => Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: MyColors.backgroung1,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: Column(
        children: <Widget>[
          buildButtonRow('AC', '<', '', '/'),
          buildButtonRow('7', '8', '9', '*'),
          buildButtonRow('4', '5', '6', '+'),
          buildButtonRow('1', '2', '3', '-'),
          buildButtonRow('0', '.', '', '='),
        ],
      ),
    );

Widget buildButtonRow(
  String first,
  String second,
  String third,
  String fourth,
) {
  final row = {first, second, third, fourth};

  return Expanded(
    child: Row(
      children: row
          .map((text) => ButtonWidget(
                text: text,
                onClicked: () => print(text),
                onClickedLong: () => print(text),
              ))
          .toList(),
    ),
  );
}
