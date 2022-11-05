// ignore_for_file: prefer_const_constructors

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class SPNumField extends StatelessWidget {
  const SPNumField(
      {Key? key,
      required this.labelText,
      required this.textEditingController,
      this.validator})
      : super(key: key);

  final String labelText;
  final TextEditingController textEditingController;

  final String? Function(String? value)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 50,
      child: TextFormField(
        style: TextStyle(
          color: Colors.grey,
          fontSize: 13,
        ),
        inputFormatters: <TextInputFormatter>[
          CurrencyTextInputFormatter(
            decimalDigits: 0,
            symbol: '\$',
          ),
        ],
        validator: validator,
        controller: textEditingController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            labelText: labelText,
            labelStyle: const TextStyle(color: Colors.black54, fontSize: 13),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                width: 1,
                color: Colors.grey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1.5,
                color: Colors.black54,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1.5, color: Colors.red),
              borderRadius: BorderRadius.circular(12),
            )),
      ),
    );
  }
}
