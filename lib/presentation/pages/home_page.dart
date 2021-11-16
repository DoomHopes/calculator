import 'package:calculator/application/calculate_notifier.dart';
import 'package:calculator/presentation/utils/colors.dart';
import 'package:calculator/presentation/widgets/button_widget.dart';
import 'package:calculator/presentation/widgets/result_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final calculateNotifier = ChangeNotifierProvider((ref) => CalculateNotifier());

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
            const Expanded(child: ResultWidget()),
            Expanded(child: buildButtons(context), flex: 3),
          ],
        ),
      ),
    );
  }
}

Widget buildPanel(BuildContext context) => Container(
      width: double.infinity,
      height: 36,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: <Widget>[
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shadowColor: Colors.transparent,
              primary: MyColors.backgroung1,
            ),
            child: const Icon(Icons.history),
          ),
          const SizedBox(
            width: 10,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shadowColor: Colors.transparent,
              primary: MyColors.backgroung1,
            ),
            child: const Icon(Icons.rule_folder_outlined),
          ),
        ],
      ),
    );

Widget buildButtons(BuildContext context) => Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: MyColors.backgroung1,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: Column(
        children: <Widget>[
          buildPanel(context),
          const Divider(
            height: 20,
          ),
          buildButtonRow(context, 'AC', '<', '%', '/'),
          buildButtonRow(context, '7', '8', '9', '*'),
          buildButtonRow(context, '4', '5', '6', '+'),
          buildButtonRow(context, '1', '2', '3', '-'),
          buildButtonRow(context, '0', '.', '()', '='),
        ],
      ),
    );

Widget buildButtonRow(
  BuildContext context,
  String first,
  String second,
  String third,
  String fourth,
) {
  final row = {first, second, third, fourth};

  return Expanded(
    child: Row(
      children: row
          .map(
            (text) => ButtonWidget(
              text: text,
              onClicked: () {
                context.read(calculateNotifier).onClick(text);
              },
              //onClickedLong: () => print(text),
            ),
          )
          .toList(),
    ),
  );
}
