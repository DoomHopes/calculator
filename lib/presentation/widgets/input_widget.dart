import 'package:flutter/material.dart';

class InputWidget extends StatefulWidget {
  const InputWidget({
    Key? key,
    required this.textEditingController,
    required this.focusNode,
    required this.onChanged,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final Function onChanged;

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  @override
  void initState() {
    widget.textEditingController.addListener(() {
      widget.onChanged();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TextField(
        controller: widget.textEditingController,
        style: const TextStyle(fontSize: 20),
        maxLines: 1,
        showCursor: true,
        readOnly: true,
        focusNode: widget.focusNode,
        textAlign: TextAlign.end,
        decoration: const InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 3),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white54, width: 1),
          ),
        ),
      ),
    );
  }
}
