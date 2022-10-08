// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:my_first_app/investments.dart';
import 'package:my_first_app/login_screen.dart';
import 'package:my_first_app/user.dart';
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
        body: SingleChildScrollView(
            child: Column(
          children: [
            //Balance
            Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(77, 208, 137, 1),
              ),
              height: 150,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('luks',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text('Balance'),
                  ],
                ),
              ),
            ),

            Center(
              child: ElevatedButton(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80.0),
                  child: Text(
                    'Volver',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
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
