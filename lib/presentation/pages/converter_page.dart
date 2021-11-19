import 'package:calculator/application/convector_notifier.dart';
import 'package:calculator/presentation/utils/colors.dart';
import 'package:calculator/presentation/widgets/button_widget.dart';
import 'package:calculator/presentation/widgets/drop_down_widget.dart';
import 'package:calculator/presentation/widgets/input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final converterNotifier = ChangeNotifierProvider((ref) => ConvectorNotifier());

class ConverterPage extends StatefulWidget {
  const ConverterPage({Key? key}) : super(key: key);

  @override
  State<ConverterPage> createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _firstController = TextEditingController();
  final FocusNode _firstFocusNode = FocusNode();
  final TextEditingController _secondController = TextEditingController();
  final FocusNode _secondFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  String _firstDropDownValue = '';
  String _secondDropDownValue = '';

  void changeFirstValue(String value) {
    _firstDropDownValue = value;
  }

  void changeSecondValue(String value) {
    _secondDropDownValue = value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Converter'),
      ),
      body: Consumer(
        builder: (context, watch, child) {
          final dropDownNotifier = watch(converterNotifier);
          return Column(
            children: <Widget>[
              SizedBox(
                height: 60,
                child: TabBar(
                  isScrollable: true,
                  controller: _tabController,
                  onTap: (value) {
                    dropDownNotifier.changeDropDownItems(value);
                  },
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
                    /*Text(
                      'Volume',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),*/
                    Text(
                      'Weight',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    /*Text(
                      'Data',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),*/
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
                child: DropDownWidget(
                  values: dropDownNotifier.dropDownItems,
                  currentItem: dropDownNotifier.dropDownItems[0],
                  itemCallBack: (String status) {
                    changeFirstValue(status);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: InputWidget(
                  textEditingController: _firstController,
                  focusNode: _firstFocusNode,
                  onChanged: () {
                    dropDownNotifier.calculate();
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                child: DropDownWidget(
                  values: dropDownNotifier.dropDownItems,
                  currentItem: dropDownNotifier.dropDownItems[0],
                  itemCallBack: (String status) {
                    changeSecondValue(status);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: InputWidget(
                  textEditingController: _secondController,
                  focusNode: _secondFocusNode,
                  onChanged: () {
                    dropDownNotifier.calculate();
                  },
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: MyColors.backgroung1,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(32)),
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
          );
        },
      ),
    );
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
                  setState(() {
                    if (_firstFocusNode.hasFocus) {
                      if (text == '<') {
                        if (_firstController.text.isEmpty) {
                          return;
                        } else {
                          _firstController.text = _firstController.text
                              .substring(0, _firstController.text.length - 1);
                        }
                      } else {
                        _firstController.text += text;
                      }
                    }
                    if (_secondFocusNode.hasFocus) {
                      if (text == '<') {
                        if (_secondController.text.isEmpty) {
                          return;
                        } else {
                          _secondController.text = _secondController.text
                              .substring(0, _secondController.text.length - 1);
                        }
                      } else {
                        _secondController.text += text;
                      }
                    }
                  });
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
