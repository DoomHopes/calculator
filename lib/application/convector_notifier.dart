import 'package:calculator/presentation/utils/drop_down_elements.dart';
import 'package:flutter/cupertino.dart';
import 'package:converter/converter.dart';

class ConvectorNotifier extends ChangeNotifier {
  Set<List<String>> dropDownElements = {
    MyDropDownElements.squares,
    MyDropDownElements.length,
    MyDropDownElements.temperature,
    //MyDropDownElements.volume,
    MyDropDownElements.weight,
    //MyDropDownElements.data,
    MyDropDownElements.speed,
    MyDropDownElements.time,
  };

  late List<String> dropDownItems = dropDownElements.elementAt(0);

  void changeDropDownItems(value) {
    dropDownItems = dropDownElements.elementAt(value);
    notifyListeners();
  }

  void calculate(TextEditingController alienController, String value,
      String first, String second) {
    //TODO calculate
    if (dropDownItems == MyDropDownElements.squares) {
      Area area = Area(double.parse(value), first);
      area.valueIn(second);
      alienController.text = area.toString();
    }
  }
}
