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
        return;
      }

      if (expression.isEmpty) {
        expression.add(symbol);
        notifyListeners();
        return;
      }
      if (operations.containsKey(symbol)) {
        // calculate();
        // TODO: refactor this if's
        final lastExpressionSymbol = expression.last;
        final lastSymbolIsOperator =
            operations.containsKey(lastExpressionSymbol);
        final lastIsNotBracket =
            lastExpressionSymbol != '(' && lastExpressionSymbol != ')';
        if (lastSymbolIsOperator) {
          //! Last symbol is operator
          print('-------- last symbol is operator --------');
          if (symbol == '(') {
            //! Inputed symbol is bracket
            if (lastExpressionSymbol == ')') {
              //! if last is right bracket we add multiply operator
              expression.add('*');
            }
            print('inputed symbol is left bracket');
            expression.add(symbol);
          } else if (symbol == ')' && lastIsNotBracket) {
            print('inputed symbol is right bracket & last is not bracket');
            // TODO: check not bracket and don't input
            final isCorrectInputRightBracket = canInputRightBracket();
            if (isCorrectInputRightBracket) {
              //! input right bracket if input will be correct
              expression.add(symbol);
            }
          } else {
            print('last exp symb: $lastExpressionSymbol');
            print('last is not bracket: $lastIsNotBracket');
            if (!lastIsNotBracket) {
              //! add operator next if last is bracket
              print('[if statement]');
              print('symbol: $symbol');
              final isInputRightBracketIncorrect = !canInputRightBracket();
              if (symbol == ')' && isInputRightBracketIncorrect) {
                print('incorrect input right bracket');
                return;
              }
              expression.add(symbol);
            } else {
              //! replace operator if it isn't bracket
              print('[else statement] - replacing...');
              expression[expression.length - 1] = symbol;
            }
          }
        } else {
          // Когда выражение заканчиваеться на ')', то после
          // нажатия на = больше нельзя ввести какие либо числа или операторы, а если скобок нет то можно
          //! Last symbol isn't operator
          print('-------- last symbol is NOT operator --------');
          if (symbol == '(') {
            //! Last is number and we add multiply operator before bracket
            //if (!lastSymbolIsOperator) {
            expression.add('*');
            expression.add(symbol);
            //}
            //bool isInputWillCorrect = isInputBracketSymbolCorrect(symbol);
            //isInputWillCorrect ? expression.add(symbol) : null;
          } else {
            expression.add(symbol);
          }
        }
      } else {
        //result = '0';
        //if (operations.containsKey(expression.last)) {
        //  expression.add('');
        //}

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
    //print('cur symbol: $symbol');
    //print('left brackets: $leftBracketsCount');
    //print('right brackets: $rightBracketsCount');
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
