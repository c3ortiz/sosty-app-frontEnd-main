// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_first_app/login_screen.dart';
import 'package:my_first_app/main_screen.dart';
import 'package:my_first_app/user.dart';
import 'package:http/http.dart' as http;

class ProjectTrackingScreen extends StatefulWidget {
  final User user;

  const ProjectTrackingScreen({
    super.key,
    required this.user,
  });

  @override
  State<ProjectTrackingScreen> createState() => _ProjectTrackingScreen(user);
}

class _ProjectTrackingScreen extends State<ProjectTrackingScreen>
    with TickerProviderStateMixin {
  final User user;

  _ProjectTrackingScreen(this.user);

  /*Future refresh() async {
    final queryParams = {'userID': user.user.userID};

    final url =
        Uri.parse('https://sosty-api.azurewebsites.net/api/User/GetUserbyID')
            .replace(queryParameters: queryParams);
    final response = await http.get(url,
        headers: <String, String>{'Content-Type': 'application/json'});

    Map<String, dynamic> map = jsonDecode(utf8.decode(response.bodyBytes));
    userInformation = UserInformation.fromJson(map);
    if (response.statusCode == 200) {
      UserInfo reloadUserInfo = UserInfo(
          userID: userInformation!.userID,
          userType: userInformation!.userType,
          balance: userInformation!.balance,
          email: userInformation!.email);

      getInvestorID();

      user.user = reloadUserInfo;
    } else {
      print(response.body);
    }

    setState(() {});
  }*/
  bool isPressed = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(250, 250, 250, 100),
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Color.fromRGBO(88, 89, 91, 100),
          onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => MainScreen(
                        user: user,
                      ))),
        ),
      ),
    );
  }
}

/*Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => MainScreen(user: user))););*/
