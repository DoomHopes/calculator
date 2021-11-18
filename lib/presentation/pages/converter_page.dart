import 'package:calculator/presentation/utils/arrays.dart';
import 'package:calculator/presentation/utils/colors.dart';
import 'package:calculator/presentation/widgets/button_widget.dart';
import 'package:calculator/presentation/widgets/drop_down_widget.dart';
import 'package:calculator/presentation/widgets/input_widget.dart';
import 'package:flutter/material.dart';

class ConverterPage extends StatefulWidget {
  const ConverterPage({Key? key}) : super(key: key);

  @override
  State<ConverterPage> createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  final TextEditingController _firstController = TextEditingController();
  final TextEditingController _secondController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 8, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Converter'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 60,
            child: TabBar(
              isScrollable: true,
              controller: _tabController,
              tabs: const <Widget>[
                Text(
                  'Square',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'Length',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'Temperature',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'Volume',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'Weight',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'Data',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'Speed',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'Time',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            child: DropDownItem(
              values: squares,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: input(_firstController, (String value) {}),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            child: DropDownItem(
              values: squares,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: input(_secondController, (String value) {}),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: MyColors.backgroung1,
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              ),
              child: Column(
                children: <Widget>[
                  buildButtonRow(context, '7', '8', '9'),
                  buildButtonRow(context, '4', '5', '6'),
                  buildButtonRow(context, '1', '2', '3'),
                  buildButtonRow(context, '0', '.', '<'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildButtonRow(
  BuildContext context,
  String first,
  String second,
  String third,
) {
  final row = {first, second, third};

  return Expanded(
    child: Row(
      children: row
          .map(
            (text) => ButtonWidget(
              text: text,
              onClicked: () {
                //TODO Something
              },
            ),
          )
          .toList(),
    ),
  );
}
