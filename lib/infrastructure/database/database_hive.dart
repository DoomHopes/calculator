import 'package:calculator/infrastructure/model/expression_model.dart';
import 'package:hive_flutter/adapters.dart';

class DatabaseHive {
  void addExpression(Expression expression) {
    final expressionBox = Hive.box('expressionbox');
    expressionBox.add(expression);
  }

  void deleteHive() {
    final expressionBox = Hive.box<Expression>('expressionbox');
    expressionBox.deleteFromDisk();
  }
}
