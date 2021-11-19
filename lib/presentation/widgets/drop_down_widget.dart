import 'package:flutter/material.dart';

class DropDownWidget extends StatefulWidget {
  final List<String> values;
  String currentItem;

  DropDownWidget({
    Key? key,
    required this.values,
    required this.currentItem,
  }) : super(key: key);

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState(currentItem);
}

class _DropDownWidgetState extends State<DropDownWidget> {
  String currentItem;
  _DropDownWidgetState(this.currentItem);
  @override
  void didUpdateWidget(DropDownWidget oldWidget) {
    if (currentItem != widget.currentItem) {
      setState(() {
        currentItem = widget.currentItem;
      });
    }
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
