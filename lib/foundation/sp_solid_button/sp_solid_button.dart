import 'package:flutter/material.dart';

class SPSolidButton extends StatelessWidget {
  const SPSolidButton({Key? key, required this.text, this.onPressed})
      : super(key: key);
  final String text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        backgroundColor:
            MaterialStateProperty.all(Color.fromRGBO(77, 208, 137, 1)),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width - 220,
        height: 35,
        child: Center(
          child: Text(text),
        ),
      ),
    );
  }
}
