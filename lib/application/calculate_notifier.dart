import 'package:flutter/cupertino.dart';

class CalculateNotifier extends ChangeNotifier {
  late String result = '0';
  late List<String> expression = [''];

  late String operator;

  void onClick(String text) {
    if (text != 'AC') {
      if (text == '<') {
        expression.removeLast();
      } else {
        expression.add(text);
      }
    } else {
      expression.clear();
    }
    notifyListeners();
  }

  String showExpression() {
    String exp = '';
    for (int i = 0; i < expression.length; i++) {
      exp += expression[i];
    }
    return exp;
  }

  void calculate() {
    expression.clear();
  }
}
