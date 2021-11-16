import 'package:flutter/cupertino.dart';
import 'package:function_tree/function_tree.dart';

enum Operations {
  plus,
  minus,
  divide,
  multiply,
  percent,
}

class CalculateNotifier extends ChangeNotifier {
  late String result = '0';
  late List<String> expression = [''];
  String number = '';

  Map<String, Operations> operations = {
    '+': Operations.plus,
    '-': Operations.minus,
    '*': Operations.multiply,
    '/': Operations.divide,
    '%': Operations.percent,
  };

  void onClick(String symbol) {
    if (symbol != 'AC') {
      if (symbol == '<') {
        if (expression.isNotEmpty) {
          String last = expression.last;
          if (last.length == 1) {
            expression.removeLast();
          } else {
            expression[expression.length - 1] =
                last.substring(0, last.length - 1);
          }
          notifyListeners();
        }
        return;
      }

      if (symbol == '=') {
        if (operations.containsKey(expression.last)) {
          expression.removeLast();
          notifyListeners();
        }
        calculate();
        return;
      }

      if (expression.isEmpty) {
        expression.add(symbol);
        notifyListeners();
        return;
      }

      if (operations.containsKey(symbol)) {
        if (operations.containsKey(expression.last)) {
          expression[expression.length - 1] = symbol;
        } else {
          expression.add(symbol);
        }
      } else {
        if (operations.containsKey(expression.last)) {
          expression.add('');
        }

        final lastIndex = expression.length - 1;
        expression[lastIndex] = expression.last + symbol;
      }
    } else {
      expression.clear();
      result = '0';
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
    String exp = expression.join();

    final res = exp.interpret();
    result = res.toString();

    notifyListeners();
  }
}
