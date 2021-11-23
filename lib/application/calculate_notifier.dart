import 'package:calculator/domain/model/expression_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:function_tree/function_tree.dart';
import 'package:hive/hive.dart';

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
  final expressionBox = Hive.box('expressionbox');

  Map<String, Operations> operations = {
    '+': Operations.plus,
    '-': Operations.minus,
    '*': Operations.multiply,
    '/': Operations.divide,
    '%': Operations.percent,
    '(': Operations.leftBracket,
    ')': Operations.rightBracket,
  };

  void addExpToHive() {
    Expression expressionHive = Expression(showExpression() + '=' + result);
    expressionBox.add(expressionHive);
    notifyListeners();
  }

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
        if (expression.isEmpty) {
          return;
        }
        final lastExpressionSymbol = expression.last;
        final lastIsNotBracket =
            lastExpressionSymbol != '(' && lastExpressionSymbol != ')';
        if (operations.containsKey(expression.last) && lastIsNotBracket) {
          expression.removeLast();
          notifyListeners();
        }
        calculate();
        addExpToHive();
        return;
      }

      if (expression.isEmpty) {
        expression.add(symbol);
        notifyListeners();
        return;
      }
      if (operations.containsKey(symbol)) {
        // TODO: refactor this if's
        final lastExpressionSymbol = expression.last;
        final lastSymbolIsOperator =
            operations.containsKey(lastExpressionSymbol);
        final lastIsNotBracket =
            lastExpressionSymbol != '(' && lastExpressionSymbol != ')';
        if (lastSymbolIsOperator) {
          //! Last symbol is operator
          if (symbol == '(') {
            //! Inputed symbol is bracket
            if (lastExpressionSymbol == ')') {
              //! if last is right bracket we add multiply operator
              expression.add('*');
            }
            expression.add(symbol);
          } else if (symbol == ')' && lastIsNotBracket) {
            // TODO: check not bracket and don't input
            final isCorrectInputRightBracket = canInputRightBracket();
            if (isCorrectInputRightBracket) {
              //! input right bracket if input will be correct
              expression.add(symbol);
            }
          } else {
            if (!lastIsNotBracket) {
              //! add operator next if last is bracket
              final isInputRightBracketIncorrect = !canInputRightBracket();
              if (symbol == ')' && isInputRightBracketIncorrect) {
                return;
              }
              expression.add(symbol);
            } else {
              //! replace operator if it isn't bracket
              expression[expression.length - 1] = symbol;
            }
          }
        } else {
          //! Last symbol isn't operator
          if (symbol == '(') {
            //! Last is number and we add multiply operator before bracket
            expression.add('*');
            expression.add(symbol);
          } else {
            expression.add(symbol);
          }
        }
      } else {
        final lastIndex = expression.length - 1;
        expression[lastIndex] = expression.last + symbol;
      }
    } else {
      expression.clear();
      result = '0';
    }
    notifyListeners();
  }

  bool canInputRightBracket() {
    int leftBracketsCount = 0;
    int rightBracketsCount = 0;
    for (var symb in expression) {
      symb.contains('(')
          ? leftBracketsCount++
          : symb.contains(')')
              ? rightBracketsCount++
              : null;
    }
    return leftBracketsCount > rightBracketsCount;
  }

  bool isInputBracketSymbolCorrect(String symbol) {
    //String oppositeBracketSymbol = symbol == '(' ? ')' : '(';
    int leftBracketsCount = 0;
    int rightBracketsCount = 0;
    for (var symb in expression) {
      symb == '(' ? leftBracketsCount++ : rightBracketsCount++;
    }
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
