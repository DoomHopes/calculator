import 'package:flutter/cupertino.dart';
import 'package:function_tree/function_tree.dart';

enum Operations {
  plus,
  minus,
  divide,
  multiply,
  percent,
  leftBracket,
  rightBracket,
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
    '(': Operations.leftBracket,
    ')': Operations.rightBracket,
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
        // calculate();
        if (operations.containsKey(expression.last) &&
            (expression.last == '(' || expression.last == ')')) {
          print('заменяем ласт...');
          expression[expression.length - 1] = symbol;
        } else {
          print('s: $symbol');
          if (symbol == '(' || symbol == ')') {
            bool isInputWillCorrect = isInputBracketSymbolCorrect(symbol);
            isInputWillCorrect ? expression.add(symbol) : null;
          } else {
            expression.add(symbol);
          }
        }
      } else {
        //result = '0';
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

  bool isInputBracketSymbolCorrect(String symbol) {
    //String oppositeBracketSymbol = symbol == '(' ? ')' : '(';
    int leftBracketsCount = 0;
    int rightBracketsCount = 0;
    for (var symb in expression) {
      symb == '(' ? leftBracketsCount++ : rightBracketsCount++;
    }
    print('cur symbol: $symbol');
    print('left brackets: $leftBracketsCount');
    print('right brackets: $rightBracketsCount');
    if (symbol == ')') {
      if (leftBracketsCount == rightBracketsCount) {
        return false;
      }
      return true; // replace
    } else {
      return true;
    }
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
