// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:my_first_app/investments.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //Investments controller
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(
          children: [
            SizedBox(height: 30),
            //app bar
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text('Mis',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold)),
                        Text(' Inversiones', style: TextStyle(fontSize: 30)),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                color: Colors.blue, shape: BoxShape.circle),
                            child: Icon(Icons.add))
                      ],
                    )
                  ],
                )),

            SizedBox(height: 30),

            //Investments
            Container(
              height: 200,
              child: PageView(
                  controller: _controller,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Investment(),
                    Investment(),
                    Investment(),
                    Investment()
                  ]),
            ),

            SizedBox(height: 19),

            SmoothPageIndicator(
                controller: _controller,
                count: 4,
                effect:
                    ExpandingDotsEffect(activeDotColor: Colors.grey.shade800)),
          ],
        )));
  }
}
