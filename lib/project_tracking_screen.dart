// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_first_app/login_screen.dart';
import 'package:my_first_app/main_screen.dart';
import 'package:my_first_app/model/GetProjectProgressInformation.dart';
import 'package:my_first_app/user.dart';
import 'package:http/http.dart' as http;

import 'model/GetInvestmentsInProgressByInvestorDTO.dart';

class ProjectTrackingScreen extends StatefulWidget {
  final User user;
  final Investment investment;

  const ProjectTrackingScreen({
    super.key,
    required this.user,
    required this.investment,
  });

  @override
  State<ProjectTrackingScreen> createState() =>
      _ProjectTrackingScreen(user, investment);
}

class _ProjectTrackingScreen extends State<ProjectTrackingScreen>
    with TickerProviderStateMixin {
  final User user;
  final Investment investment;
  GetProjectProgressInformation? investmentInfo;

  _ProjectTrackingScreen(this.user, this.investment);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => getProjectTracking());
  }

  Future getProjectTracking() async {
    final queryParams = {'investmendID': investment.investmendID};
    final url = Uri.parse(
            'https://sosty-api.azurewebsites.net/api/Project/GetProjectProgressInformation')
        .replace(queryParameters: queryParams);
    final response = await http.get(url, headers: <String, String>{
      'Content-Type': 'application/json',
      'Authorization': user.accessToken.toString()
    });

    Map<String, dynamic> map = jsonDecode(response.body);
    investmentInfo = GetProjectProgressInformation.fromJson(map);
    setState(() {});
  }

  bool isPressed = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(investmentInfo?.locationAddress ?? ""),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(250, 250, 250, 100),
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: const Color.fromRGBO(88, 89, 91, 100),
          onPressed: () => Navigator.pop(
            context,
          ),
        ),
      ),
    );
  }
}

/*Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => MainScreen(user: user))););*/
