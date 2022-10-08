// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:my_first_app/investments.dart';
import 'package:my_first_app/user.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MainScreen extends StatefulWidget {
  final User user;
  const MainScreen({super.key, required this.user});

  @override
  State<MainScreen> createState() => _MainScreenState(user);
}

class _MainScreenState extends State<MainScreen> {
  //Investments controller
  final _controller = PageController();
  final User user;

  _MainScreenState(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(
          children: [
            //Balance
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                color: Color.fromRGBO(77, 208, 137, 1),
              ),
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("\$ ${user.user.balance}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      "balance",
                    ),
                  ]),
                ],
              ),
            ),

            SizedBox(height: 30),

            //Mis inversiones statement
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Row(children: [
                  Text('Mis',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  Text(' Inversiones', style: TextStyle(fontSize: 30)),
                ])),

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

            //Balance
            SizedBox(height: 30),
          ],
        )));
  }
}
