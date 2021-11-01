import 'package:calculator/widgets/action_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Row(
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
                color: Colors.grey,
                function: () {},
              ),
            ],
          ),
          Row(
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
                color: Colors.grey,
                function: () {},
              ),
            ],
          ),
          Row(
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
                color: Colors.grey,
                function: () {},
              ),
            ],
          ),
          Row(
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
                color: Colors.grey,
                function: () {},
              ),
              ActionButton(
                text: '=',
                color: Colors.grey,
                function: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
