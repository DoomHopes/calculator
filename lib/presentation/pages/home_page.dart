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

Widget buildButtons(BuildContext context) => Scaffold(
      drawer: Drawer(
        child: Container(
          color: Colors.green[900],
        ),
      ),
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        title: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.rule_folder_outlined),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.history),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: MyColors.backgroung1,
          borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
        ),
        child: Column(
          children: <Widget>[
            buildButtonRow(context, 'AC', '<', '()', '/'),
            buildButtonRow(context, '7', '8', '9', '*'),
            buildButtonRow(context, '4', '5', '6', '+'),
            buildButtonRow(context, '1', '2', '3', '-'),
            buildButtonRow(context, '0', '.', '%', '='),
          ],
        ),
      ),
    );

/*Widget buildButtons(BuildContext context) => Container(
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
*/

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
