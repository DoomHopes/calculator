import 'package:calculator/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResultWidget extends StatelessWidget {
  const ResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Consumer(
        builder: (context, watch, child) {
          final textNotifier = watch(calculateNotifier);
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                textNotifier.showExpression(),
                textAlign: TextAlign.right,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.white, fontSize: 23),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                textNotifier.result,
                textAlign: TextAlign.right,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.grey, fontSize: 36),
              ),
            ],
          );
        },
      ),
    );
  }
}
