import 'package:calculator/widgets/action_button.dart';
import 'package:calculator/widgets/result_display.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ResultDisplay(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ActionButton(
                text: '7',
                color: Colors.grey,
                function: () {},
              ),
              ActionButton(
                text: '8',
                color: Colors.grey,
                function: () {},
              ),
              ActionButton(
                text: '9',
                color: Colors.grey,
                function: () {},
              ),
              ActionButton(
                text: '+',
                color: Colors.orange,
                function: () {},
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ActionButton(
                text: '4',
                color: Colors.grey,
                function: () {},
              ),
              ActionButton(
                text: '5',
                color: Colors.grey,
                function: () {},
              ),
              ActionButton(
                text: '6',
                color: Colors.grey,
                function: () {},
              ),
              ActionButton(
                text: '/',
                color: Colors.orange,
                function: () {},
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ActionButton(
                text: '1',
                color: Colors.grey,
                function: () {},
              ),
              ActionButton(
                text: '2',
                color: Colors.grey,
                function: () {},
              ),
              ActionButton(
                text: '3',
                color: Colors.grey,
                function: () {},
              ),
              ActionButton(
                text: '+',
                color: Colors.orange,
                function: () {},
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ActionButton(
                text: '0',
                color: Colors.grey,
                function: () {},
              ),
              ActionButton(
                text: ',',
                color: Colors.grey,
                function: () {},
              ),
              ActionButton(
                text: 'C',
                color: Colors.orange,
                function: () {},
              ),
              ActionButton(
                text: '=',
                color: Colors.orange,
                function: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
