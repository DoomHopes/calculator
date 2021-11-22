import 'package:calculator/application/calculate_notifier.dart';
import 'package:calculator/infrastructure/model/expression_model.dart';

import 'package:calculator/presentation/pages/converter_page.dart';
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
          children: const <Widget>[
            Expanded(child: ResultWidget()),
            Expanded(child: BuildButtons(), flex: 3),
          ],
        ),
      ),
    );
  }
}

class BuildButtons extends StatefulWidget {
  const BuildButtons({Key? key}) : super(key: key);

  @override
  State<BuildButtons> createState() => _BuildButtonsState();
}

/* */

/*, */

class _BuildButtonsState extends State<BuildButtons> {
  @override
  Widget build(BuildContext context) {
    final expressionBox = context.read(calculateNotifier).expressionBox;
    return Scaffold(
      drawer: Drawer(
        child: Consumer(
          builder: (context, watch, child) {
            final drawerNotifier = watch(calculateNotifier);
            return Column(
              children: <Widget>[
                Expanded(
                  child: SizedBox(
                    width: double.maxFinite,
                    child: ListView.builder(
                      itemCount: drawerNotifier.expressionBox.length,
                      itemBuilder: (BuildContext context, int index) {
                        final exp = drawerNotifier.expressionBox.get(index)
                            as Expression;
                        return ListTile(
                          title: Text(
                            exp.expression,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      drawerNotifier.expressionBox.clear();
                      Navigator.pop(context);
                    },
                    child: const Text('Clear history'),
                  ),
                )
              ],
            );
          },
        ),
      ),
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        title: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ConverterPage(),
              ),
            );
          },
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
            buildButtonRow(context, 'AC', '<', '', ''),
            buildButtonRow(context, '(', ')', '%', '/'),
            buildButtonRow(context, '7', '8', '9', '*'),
            buildButtonRow(context, '4', '5', '6', '+'),
            buildButtonRow(context, '1', '2', '3', '-'),
            buildButtonRow(context, '0', '.', '', '='),
          ],
        ),
      ),
    );
  }
}

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
            ),
          )
          .toList(),
    ),
  );
}
