import 'package:flutter/material.dart';

class ResultDisplay extends StatelessWidget {
  final int result;
  final String text;

  ResultDisplay({this.text = '0', this.result = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: 100,
      color: Colors.transparent,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 34),
      ),
    );
  }
}
