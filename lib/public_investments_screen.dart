import 'package:flutter/material.dart';
import 'package:my_first_app/investmentsUI.dart';
import 'package:my_first_app/model/GetPublicTopProjects.dart';
import 'package:my_first_app/model/user_information.dart';
import 'package:my_first_app/user.dart';
import 'package:my_first_app/user_profile_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

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
  UserInformation? userInformation;
  List<GetPublicTopProjects>? topProjects = [];
  final User user;

  _PublicInvestmentsScreenState(this.user, this.userInformation);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => getTopProjects());
  }

  Future getTopProjects() async {
    final url = Uri.parse(
        'https://sosty-api.azurewebsites.net/api/Project/GetPublicTopProjects');
    final response = await http.get(url,
        headers: <String, String>{'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      List<dynamic> map = jsonDecode(utf8.decode(response.bodyBytes));
      for (var i = 0; i < map.length; i++) {
        topProjects!.add(GetPublicTopProjects.fromJson(map[i]));
      }
    }
    setState(() {});
  }

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
                      for (var items in topProjects!)
                        Container(
                            width: 300,
                            height: 200,
                            decoration: BoxDecoration(color: Colors.blue),
                            child: Text(
                              items.projectName.toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                              textAlign: TextAlign.center,
                            )),
                    ]),
              ),
            ),

            SizedBox(height: 15),

            if (topProjects!.isNotEmpty)
              (SmoothPageIndicator(
                  controller: _controller,
                  count: topProjects!.length,
                  effect: ExpandingDotsEffect(
                      activeDotColor: Colors.grey.shade800))),

            //Balance
            SizedBox(height: 30),
          ],
        )));
  }

  // static Container makeContainersTopProjects() {
  //   Container container;
  //   for (var i = 0; i < topProjects; i++) {

  //   }
  // }
}
