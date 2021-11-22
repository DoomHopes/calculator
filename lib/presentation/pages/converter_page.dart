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
  void didChangeDependencies() {
    context.read(converterNotifier).dropDownItems =
        context.read(converterNotifier).dropDownElements.elementAt(0);
    super.didChangeDependencies();
  }

  @override
  void initState() {
    _tabController = TabController(length: 6, vsync: this);
    _firstFocusNode.requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  late String _firstDropDownValue;
  late String _secondDropDownValue;

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
          _firstDropDownValue = dropDownNotifier.dropDownItems[0];
          _secondDropDownValue = dropDownNotifier.dropDownItems[0];
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
                  currentItem: _firstDropDownValue,
                  itemCallBack: (String status) {
                    changeFirstValue(status);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                //! First input
                child: InputWidget(
                  textEditingController: _firstController,
                  focusNode: _firstFocusNode,
                  onChanged: () {
                    dropDownNotifier.calculate(
                      alienController: _secondController,
                      first: _firstDropDownValue,
                      second: _secondDropDownValue,
                      value: _firstController.text,
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                child: DropDownWidget(
                  values: dropDownNotifier.dropDownItems,
                  currentItem: _secondDropDownValue,
                  itemCallBack: (String status) {
                    changeSecondValue(status);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                //! Second input
                child: InputWidget(
                  textEditingController: _secondController,
                  focusNode: _secondFocusNode,
                  onChanged: () {
                    dropDownNotifier.calculate(
                      alienController: _firstController,
                      first: _secondDropDownValue,
                      second: _firstDropDownValue,
                      value: _secondController.text,
                    );
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
                      buildButtonRow(context, '7', '8', '9', _firstController,
                          _secondController, _firstFocusNode, _secondFocusNode),
                      buildButtonRow(context, '4', '5', '6', _firstController,
                          _secondController, _firstFocusNode, _secondFocusNode),
                      buildButtonRow(context, '1', '2', '3', _firstController,
                          _secondController, _firstFocusNode, _secondFocusNode),
                      buildButtonRow(context, 'AC', '0', '<', _firstController,
                          _secondController, _firstFocusNode, _secondFocusNode),
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
}

Widget buildButtonRow(
  BuildContext context,
  String first,
  String second,
  String third,
  TextEditingController _firstController,
  TextEditingController _secondController,
  FocusNode _firstFocusNode,
  FocusNode _secondFocusNode,
) {
  final row = {first, second, third};

  return Expanded(
    child: Row(
      children: row
          .map(
            (text) => ButtonWidget(
              text: text,
              onClicked: () {
                if (_firstFocusNode.hasFocus) {
                  if (text != 'AC') {
                    if (text == '<') {
                      if (_firstController.text.isEmpty) {
                        _secondController.clear();
                        return;
                      } else {
                        _firstController.text = _firstController.text
                            .substring(0, _firstController.text.length - 1);
                      }
                    } else {
                      _firstController.text += text;
                    }
                  } else {
                    _firstController.clear();
                  }
                }
                if (_secondFocusNode.hasFocus) {
                  if (text != 'AC') {
                    if (text == '<') {
                      if (_secondController.text.isEmpty) {
                        _firstController.clear();
                        return;
                      } else {
                        _secondController.text = _secondController.text
                            .substring(0, _secondController.text.length - 1);
                      }
                    } else {
                      _secondController.text += text;
                    }
                  } else {
                    _secondController.clear();
                  }
                }
              },
            ),
          )
          .toList(),
    ),
  );
}
