import 'package:hive/hive.dart';

part 'expression_model.g.dart';

@HiveType(typeId: 0)
class Expression {
  @HiveField(0)
  int id;
  @HiveField(1)
  String expression;

  Expression(this.expression, this.id);
}
