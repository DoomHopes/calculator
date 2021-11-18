import 'package:flutter/material.dart';

Widget input(TextEditingController textEditingController, FocusNode focusNode,
    Function(String) onChanged) {
  return Container(
    padding: const EdgeInsets.only(left: 20, right: 20),
    child: TextField(
      controller: textEditingController,
      style: const TextStyle(fontSize: 20),
      maxLines: 1,
      showCursor: false,
      readOnly: true,
      focusNode: focusNode,
      onChanged: onChanged,
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
