// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class Investment extends StatelessWidget {
  const Investment({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Container(
        width: 350,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.green[100], borderRadius: BorderRadius.circular(16)),
        child: Column(children: [
          Text('Soy una inversión'),
          SizedBox(height: 80),
          Text('Con mucha rentabilidad')
        ]),
      ),
    );
  }
}
