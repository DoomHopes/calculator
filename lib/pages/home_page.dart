import 'package:calculator/utils/colors.dart';
import 'package:calculator/widgets/button_widget.dart';
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
            Expanded(child: buildResult()),
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

Widget buildResult() => Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '0',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.white, fontSize: 36),
          ),
          const SizedBox(height: 24),
          Text(
            '0',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.grey, fontSize: 18),
          ),
        ],
      ),
    );
