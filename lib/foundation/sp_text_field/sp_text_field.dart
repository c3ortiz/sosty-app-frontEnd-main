// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SPTextFormField extends StatelessWidget {
  const SPTextFormField(
      {Key? key, required this.labelText, required this.textEditingController})
      : super(key: key);

  final String labelText;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 50,
      child: TextFormField(
        style: TextStyle(
          color: Colors.grey,
          fontSize: 13,
        ),
        validator: (value) {
          print(value);
          if (value!.isEmpty) {
            return "Campo no puede estar vacío";
          }
          return null;
        },
        decoration: InputDecoration(
            labelText: labelText,
            labelStyle: const TextStyle(color: Colors.black54, fontSize: 13),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: Colors.grey,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 1.5,
                color: Colors.black54,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1.5, color: Colors.red),
              borderRadius: BorderRadius.circular(12),
            )),
      ),
    );
  }
}
