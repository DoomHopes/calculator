import 'package:calculator/presentation/utils/drop_down_elements.dart';
import 'package:converter/converter.dart';
import 'package:flutter/cupertino.dart';

class ConvectorNotifier extends ChangeNotifier {
  Set<List<String>> dropDownElements = {
    MyDropDownElements.squares,
    MyDropDownElements.length,
    MyDropDownElements.temperature,
    MyDropDownElements.weight,
    MyDropDownElements.speed,
    MyDropDownElements.time,
  };

  late List<String> dropDownItems = dropDownElements.elementAt(0);

  void changeDropDownItems(value) {
    dropDownItems = dropDownElements.elementAt(value);
    notifyListeners();
  }

  void calculate({
    required TextEditingController alienController,
    required String value,
    required String first,
    required String second,
  }) {
    if (dropDownItems == MyDropDownElements.squares) {
      final val = int.parse(value);
      final Area area = Area(val, first);
      final num valueIn = area.valueIn(second);
      alienController.text = valueIn.toString();
    }
    if (dropDownItems == MyDropDownElements.length) {
      final val = int.tryParse(value);
      if (val == null) return;
      final Length length = Length(val, first);
      final num valueIn = length.valueIn(second);
      alienController.text = valueIn.toString();
    }
    if (dropDownItems == MyDropDownElements.temperature) {
      final val = int.tryParse(value);
      if (val == null) return;
      final Temperature tem = Temperature(val, first);
      final num valueIn = tem.valueIn(second);
      alienController.text = valueIn.toString();
    }
    if (dropDownItems == MyDropDownElements.speed) {
      final val = int.tryParse(value);
      if (val == null) return;
      final Speed speed = Speed(val, first);
      final num valueIn = speed.valueIn(second);
      alienController.text = valueIn.toString();
    }
    if (dropDownItems == MyDropDownElements.time) {
      final val = int.tryParse(value);
      if (val == null) return;
      final Time time = Time(val, first);
      final num valueIn = time.valueIn(second);
      alienController.text = valueIn.toString();
    }
    if (dropDownItems == MyDropDownElements.weight) {
      final val = int.tryParse(value);
      if (val == null) return;
      final Mass mass = Mass(val, first);
      final num valueIn = mass.valueIn(second);
      alienController.text = valueIn.toString();
    }
  }
}
