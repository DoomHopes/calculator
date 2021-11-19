// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class DropDownWidget extends StatefulWidget {
  final List<String> values;
  String currentItem;
  final ValueChanged<String> itemCallBack;

  DropDownWidget({
    Key? key,
    required this.values,
    required this.currentItem,
    required this.itemCallBack,
  }) : super(key: key);

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  @override
  void didUpdateWidget(DropDownWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: widget.currentItem,
      icon: const Icon(Icons.arrow_downward),
      isExpanded: true,
      iconSize: 24,
      elevation: 16,
      onChanged: (String? newValue) {
        setState(() {
          widget.currentItem = newValue!;
          widget.itemCallBack(newValue);
        });
      },
      items: widget.values.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
