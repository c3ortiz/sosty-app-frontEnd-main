import 'package:flutter/material.dart';
import 'package:my_first_app/investmentsUI.dart';
import 'package:my_first_app/model/user_information.dart';
import 'package:my_first_app/user.dart';
import 'package:my_first_app/user_profile_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'model/GetInvestmentsInProgressByInvestorDTO.dart';

class PublicInvestmentsScreen extends StatefulWidget {
  final User user;
  final UserInformation? userInformation;

  const PublicInvestmentsScreen({
    Key? key,
    required this.user,
    required this.userInformation,
  }) : super(key: key);

  @override
  _PublicInvestmentsScreenState createState() =>
      _PublicInvestmentsScreenState(this.user, this.userInformation);
}

class _PublicInvestmentsScreenState extends State<PublicInvestmentsScreen> {
  final _controller = PageController();
  _PublicInvestmentsScreenState(this.user, this.userInformation);

  UserInformation? userInformation;
  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          backgroundColor: Color.fromRGBO(77, 208, 137, 1),
          child: Icon(Icons.close, size: 35),
        ),
        body: SafeArea(
            child: Column(
          children: [
            SizedBox(height: 25),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Row(children: [
                  Text('Invierte con',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  Text(' Nosotros', style: TextStyle(fontSize: 30)),
                ])),

            SizedBox(height: 70),
            //Investments

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                height: 475,
                child: PageView(
                    controller: _controller,
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                          width: 300,
                          height: 200,
                          decoration: BoxDecoration(color: Colors.blue),
                          child: Text('1')),
                      Container(
                          width: 300,
                          height: 200,
                          decoration: BoxDecoration(color: Colors.blue),
                          child: Text('2')),
                      Container(
                          width: 300,
                          height: 200,
                          decoration: BoxDecoration(color: Colors.blue),
                          child: Text('3')),
                      Container(
                          width: 300,
                          height: 200,
                          decoration: BoxDecoration(color: Colors.blue),
                          child: Text('4'))
                    ]),
              ),
            ),

            SizedBox(height: 15),

            (SmoothPageIndicator(
                controller: _controller,
                count: 4,
                effect:
                    ExpandingDotsEffect(activeDotColor: Colors.grey.shade800))),

            //Balance
            SizedBox(height: 30),
          ],
        )));
  }
}
