// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, no_logic_in_create_state

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_first_app/investmentsUI.dart';
import 'package:my_first_app/model/user_information.dart';
import 'package:my_first_app/public_investments_screen.dart';
import 'package:my_first_app/user.dart';
import 'package:http/http.dart' as http;
import 'package:my_first_app/model/GetInvestmentsInProgressByInvestorDTO.dart';
import 'package:my_first_app/user_profile_screen.dart';
import 'package:http/http.dart' show get;
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class MainScreen extends StatefulWidget {
  final User user;
  final GetInvestmentsInProgressByInvestorDTO? investmentInformation;
  final UserInformation? userInformation;

  const MainScreen({
    super.key,
    required this.user,
    this.investmentInformation,
    this.userInformation,
  });

  @override
  State<MainScreen> createState() =>
      _MainScreenState(user, investmentInformation, userInformation);
}

class _MainScreenState extends State<MainScreen> {
  //Investments controller
  final _controller = PageController();
  User user;

  GetInvestmentsInProgressByInvestorDTO? investmentInformation;
  UserInformation? userInformation;

  _MainScreenState(this.user, this.investmentInformation, this.userInformation);

  Future refresh() async {
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
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => refresh());
    WidgetsBinding.instance.addPostFrameCallback((_) => getInvestorID());
  }

  Future getInvestorID() async {
    final queryParams = {'investorID': user.user.userID};
    final url = Uri.parse(
            'https://sosty-api.azurewebsites.net/api/Investment/GetInvestmentsInProgressByInvestor')
        .replace(queryParameters: queryParams);
    final response = await http.get(url, headers: <String, String>{
      'Content-Type': 'application/json',
      'Authorization': user.accessToken.toString()
    });

    Map<String, dynamic> map = jsonDecode(response.body);
    investmentInformation = GetInvestmentsInProgressByInvestorDTO.fromJson(map);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: Stack(
          children: [
            Positioned(
              left: 180,
              bottom: 40,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          transitionDuration: Duration(seconds: 1),
                          transitionsBuilder: (BuildContext context,
                              Animation<double> animation,
                              Animation<double> secAnimation,
                              Widget child) {
                            animation = CurvedAnimation(
                                parent: animation, curve: Curves.easeInOutExpo);
                            return ScaleTransition(
                                scale: animation,
                                child: child,
                                alignment: Alignment.center);
                          },
                          pageBuilder: (BuildContext context,
                              Animation<double> animation,
                              Animation<double> secAnimation) {
                            return PublicInvestmentsScreen(
                                user: this.user,
                                userInformation: this.userInformation);
                          }));
                },
                backgroundColor: Color.fromRGBO(77, 208, 137, 1),
                child: Icon(Icons.add, size: 35),
              ),
            ),
            Positioned(
              bottom: 80,
              right: 20,
              child: FloatingActionButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        elevation: 16,
                        child: Container(
                          child: ListView(
                            shrinkWrap: true,
                            children: <Widget>[
                              SizedBox(height: 20),
                              Center(child: Text('Contactanos')),
                              SizedBox(height: 20),
                              _buildRow(Icons.whatsapp, Colors.green,
                                  'https://wa.me/+573204357649'),
                              _buildRow(Icons.facebook, Colors.blue,
                                  'https://wa.me/+573204357649'),
                              _buildRow(
                                  Icons.message_rounded,
                                  Color.fromRGBO(225, 48, 108, 1),
                                  'https://wa.me/+573204357649')
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                backgroundColor: Color.fromRGBO(77, 208, 137, 1),
                child: Icon(Icons.contact_support, size: 35),
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white10,
            border: Border.all(width: 1, color: Colors.black),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 6, bottom: 6),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.home,
                        size: 33,
                        color: Colors.black,
                      )),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                transitionDuration: Duration(seconds: 1),
                                transitionsBuilder: (BuildContext context,
                                    Animation<double> animation,
                                    Animation<double> secAnimation,
                                    Widget child) {
                                  animation = CurvedAnimation(
                                      parent: animation,
                                      curve: Curves.easeInOutExpo);
                                  return ScaleTransition(
                                      scale: animation,
                                      child: child,
                                      alignment: Alignment.center);
                                },
                                pageBuilder: (BuildContext context,
                                    Animation<double> animation,
                                    Animation<double> secAnimation) {
                                  return UserProfileScreen(
                                    user: user,
                                    userInformation: userInformation,
                                  );
                                }));
                      },
                      icon: Icon(Icons.person, size: 33, color: Colors.grey))
                ]),
          ),
        ),
        body: RefreshIndicator(
            onRefresh: refresh,
            child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
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
                      height: 120,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  "\$ " +
                                      NumberFormat('#,##0', "es_CO")
                                          .format(user.user.balance)
                                          .toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
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
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Mis Inversiones',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold)),
                            ])),

                    SizedBox(height: 15),
                    //Investments

                    Container(
                      height: 475,
                      child: PageView(
                          controller: _controller,
                          scrollDirection: Axis.horizontal,
                          children: [
                            if (investmentInformation != null)
                              if (investmentInformation!.items!.isNotEmpty)
                                for (var items in investmentInformation!.items!)
                                  investmentsUI(
                                      items.project!, items.investment!, user)
                              else
                                Container(
                                  padding: EdgeInsets.all(30),
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              "Aún no tienes inversiones con nosotros, encuentra nuestras inversiones mas recientes ",
                                          style: TextStyle(
                                              fontFamily:
                                                  GoogleFonts.montserrat()
                                                      .fontFamily,
                                              fontSize: 17,
                                              color: Colors.black),
                                        ),
                                        TextSpan(
                                            text: 'aquí',
                                            style: TextStyle(
                                                fontFamily:
                                                    GoogleFonts.montserrat()
                                                        .fontFamily,
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromRGBO(
                                                    77, 208, 137, 1)),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                Navigator.push(
                                                    context,
                                                    PageRouteBuilder(
                                                        transitionDuration:
                                                            Duration(
                                                                seconds: 1),
                                                        transitionsBuilder:
                                                            (BuildContext
                                                                    context,
                                                                Animation<
                                                                        double>
                                                                    animation,
                                                                Animation<
                                                                        double>
                                                                    secAnimation,
                                                                Widget child) {
                                                          animation =
                                                              CurvedAnimation(
                                                                  parent:
                                                                      animation,
                                                                  curve: Curves
                                                                      .easeInOutExpo);
                                                          return ScaleTransition(
                                                              scale: animation,
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: child);
                                                        },
                                                        pageBuilder: (BuildContext
                                                                context,
                                                            Animation<double>
                                                                animation,
                                                            Animation<double>
                                                                secAnimation) {
                                                          return PublicInvestmentsScreen(
                                                              user: user,
                                                              userInformation:
                                                                  userInformation);
                                                        }));
                                              }),
                                      ],
                                    ),
                                  ),
                                  // child: Text(
                                  //   "Aún no tienes inversiones con nosotros, encuentra nuestras inversiones mas recientes en el botón +",
                                  //   textAlign: TextAlign.left,
                                  //   style: TextStyle(
                                  //       fontSize: 17,
                                  //       fontWeight: FontWeight.normal,
                                  //       fontFamily: GoogleFonts.montserrat()
                                  //           .fontFamily),
                                  // ),
                                )
                          ]),
                    ),

                    SizedBox(height: 15),
                    if (investmentInformation != null)
                      if (investmentInformation!.items!.isNotEmpty)
                        (SmoothPageIndicator(
                            controller: _controller,
                            count: investmentInformation!.items!.length,
                            effect: ExpandingDotsEffect(
                                activeDotColor: Colors.grey.shade800))),

                    SizedBox(height: 30),
                  ],
                ))));
  }
}

Future<void> _launchUrl(Uri url) async {
  if (!await launchUrl(url)) {
    throw 'Could not launch $url';
  }
}

Widget _buildRow(IconData iconData, Color colors, String urlMedia) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Column(
      children: <Widget>[
        Container(height: 1, color: Color.fromARGB(255, 121, 121, 121)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
                onPressed: () {
                  Uri url = Uri.parse(urlMedia);
                  _launchUrl(url);
                },
                color: colors,
                icon: Icon(iconData)),
          ],
        ),
      ],
    ),
  );
}
