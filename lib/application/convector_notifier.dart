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
      num valueIn = Area(double.parse(value), first).valueIn(second);
      alienController.text = valueIn.toString();
    }
    if (dropDownItems == MyDropDownElements.length) {
      num valueIn = Length(double.parse(value), first).valueIn(second);
      alienController.text = valueIn.toString();
    }
    if (dropDownItems == MyDropDownElements.temperature) {
      num valueIn = Temperature(double.parse(value), first).valueIn(second);
      alienController.text = valueIn.toString();
    }
    if (dropDownItems == MyDropDownElements.speed) {
      num valueIn = Speed(double.parse(value), first).valueIn(second);
      alienController.text = valueIn.toString();
    }
    if (dropDownItems == MyDropDownElements.time) {
      num valueIn = Time(double.parse(value), first).valueIn(second);
      alienController.text = valueIn.toString();
    }
    if (dropDownItems == MyDropDownElements.weight) {
      num valueIn = Mass(double.parse(value), first).valueIn(second);
      alienController.text = valueIn.toString();
    }
  }
}
