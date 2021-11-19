import 'package:calculator/presentation/utils/drop_down_elements.dart';
import 'package:flutter/cupertino.dart';

class ConvectorNotifier extends ChangeNotifier {
  Set<List<String>> dropDownElements = {
    MyDropDownElements.squares,
    MyDropDownElements.length,
    MyDropDownElements.temperature,
    MyDropDownElements.volume,
    MyDropDownElements.weight,
    MyDropDownElements.data,
    MyDropDownElements.speed,
    MyDropDownElements.time,
  };

  late List<String> dropDownItems = dropDownElements.elementAt(0);
  String _firstDropDownValue = '';
  String _secondDropDownValue = '';

  void changeDropDownItems(value) {
    dropDownItems = dropDownElements.elementAt(value);
    notifyListeners();
  }

  void changeFirstValue(String value) {
    _firstDropDownValue = value;
    print(_firstDropDownValue);
  }

  void changeSecondValue(String value) {
    _secondDropDownValue = value;
    print(_secondDropDownValue);
  }

  void calculate(TextEditingController alienController) {}
}
