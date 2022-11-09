import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:my_first_app/foundation/sp_num_field/sp_num_field.dart';
import 'package:my_first_app/investmentsUI.dart';
import 'package:my_first_app/model/GetPublicTopProjects.dart';
import 'package:my_first_app/model/user_information.dart';
import 'package:my_first_app/public_investements_screenstate.dart';
import 'package:my_first_app/user.dart';
import 'package:my_first_app/user_profile_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:intl/intl.dart';

import 'foundation/sp_solid_button/sp_solid_button.dart';
import 'foundation/sp_text_field/sp_text_field.dart';
import 'model/GetInvestmentsInProgressByInvestorDTO.dart';
import 'new_investment_screen.dart';

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

  String _estimacion = '';

  _PublicInvestmentsScreenState(this.user, this.userInformation);

  TextEditingController _simulacionInversion = TextEditingController();

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
            child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 25),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(children: [
                    Text('Invierte con',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                    Text(' nosotros', style: TextStyle(fontSize: 30)),
                  ])),

              SizedBox(height: 20),
              //Investments

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  height: 680,
                  child: PageView(
                      controller: _controller,
                      scrollDirection: Axis.horizontal,
                      children: [
                        for (var items in topProjects!)
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Container(
                                      width: 350,
                                      height: 195,
                                      child: CachedNetworkImage(
                                        placeholder: (context, url) {
                                          return LoadingAnimationWidget.inkDrop(
                                            color: Colors.white,
                                            size: 50,
                                          );
                                        },
                                        imageUrl: items.projectImageUrl1,
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                          width: 80.0,
                                          height: 80.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.fill),
                                          ),
                                        ),
                                      )),
                                ),
                                SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    width: 350,
                                    height: 470,
                                    child: DefaultTextStyle.merge(
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Text(
                                              items.projectName,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily:
                                                      GoogleFonts.montserrat()
                                                          .fontFamily),
                                            ),
                                            SizedBox(height: 5),
                                            listProfile(
                                                Icons.monetization_on,
                                                "Inversión mínima",
                                                "\$ " +
                                                    NumberFormat(
                                                            '#,##0', "es_CO")
                                                        .format(int.parse(items
                                                            .investmentRequired
                                                            .toString()))
                                                        .toString(),
                                                items.projectStatus.toString()),
                                            listProfile(
                                                Icons.grass,
                                                "Cabezas de ganado totales",
                                                items.amountOfCattles
                                                    .toString(),
                                                items.projectStatus.toString()),
                                            listProfile(
                                                Icons.label_sharp,
                                                "Estado",
                                                items.projectStatus.toString(),
                                                items.projectStatus.toString()),
                                            listProfile(
                                                Icons.keyboard_double_arrow_up,
                                                "Rentabilidad estimada*",
                                                "${items.projectProfitability} % (E.A)",
                                                items.projectStatus.toString()),
                                            listProfile(
                                                Icons.watch,
                                                "Duración",
                                                "${items.projectDuration.toString()} meses",
                                                items.projectStatus.toString()),
                                            listProfile(
                                                Icons.people,
                                                "Neoganaderos",
                                                items.amountOfInvestors
                                                    .toString(),
                                                items.projectStatus.toString()),
                                            listProfile(
                                                Icons.location_pin,
                                                "Ubicación",
                                                items.locationAddress
                                                    .toString(),
                                                items.projectStatus.toString()),
                                            SizedBox(height: 15),
                                            SPSolidButton(
                                              text: "Invierte ahora",
                                              onPressed: (() {
                                                Navigator.push(
                                                    context,
                                                    PageRouteBuilder(
                                                      pageBuilder: (context,
                                                              animation,
                                                              secondaryAnimation) =>
                                                          NewInvestmentScreen(
                                                        items,
                                                        inversion: double.parse(
                                                            items
                                                                .investmentRequired
                                                                .toString()),
                                                      ),
                                                      transitionsBuilder:
                                                          (context,
                                                              animation,
                                                              secondaryAnimation,
                                                              child) {
                                                        const begin =
                                                            Offset(0.0, 1.0);
                                                        const end = Offset.zero;
                                                        const curve =
                                                            Curves.ease;

                                                        var tween = Tween(
                                                                begin: begin,
                                                                end: end)
                                                            .chain(CurveTween(
                                                                curve: curve));

                                                        return SlideTransition(
                                                          position: animation
                                                              .drive(tween),
                                                          child: child,
                                                        );
                                                      },
                                                    ));
                                              }),
                                            ),
                                            RichText(
                                                text: TextSpan(
                                                    text: 'Simula tu inversión',
                                                    style: TextStyle(
                                                        fontFamily: GoogleFonts
                                                                .montserrat()
                                                            .fontFamily,
                                                        fontSize: 15,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        color: Color.fromARGB(
                                                            255, 0, 0, 0)),
                                                    recognizer:
                                                        TapGestureRecognizer()
                                                          ..onTap = () {
                                                            showDialog(
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return PublicInvestmentsScreenState(
                                                                  rentabilidad:
                                                                      items
                                                                          .projectProfitability,
                                                                  inversionMinima:
                                                                      items
                                                                          .investmentRequired,
                                                                  duracionEstimada:
                                                                      items
                                                                          .projectDuration,
                                                                  publicProjectInfo:
                                                                      items,
                                                                );
                                                              },
                                                            );
                                                          })),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ]),
                ),
              ),

              if (topProjects!.isNotEmpty)
                (SmoothPageIndicator(
                    controller: _controller,
                    count: topProjects!.length,
                    effect: ExpandingDotsEffect(
                        activeDotColor: Colors.grey.shade800))),

              SizedBox(height: 20),
            ],
          ),
        )));
  }

  int estimar(String valor) {
    var finalEstimation;
    if (valor.isEmpty) {
      finalEstimation = 0;
    } else {
      finalEstimation = int.parse(valor) * 2;
    }

    return finalEstimation;
  }

  // static Container makeContainersTopProjects() {
  //   Container container;
  //   for (var i = 0; i < topProjects; i++) {

  //   }
  // }
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
                  // _launchUrl(url);
                },
                color: colors,
                icon: FaIcon(iconData)),
          ],
        ),
      ],
    ),
  );
}

Widget listProfile(IconData icon, String text1, String text2, String state) {
  Color colorText;
  if (state.toLowerCase().trim() == "finalizado") {
    colorText = Colors.grey;
  } else {
    colorText = Colors.black87;
  }

  return Container(
    width: double.infinity,
    margin: const EdgeInsets.only(top: 10),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 30,
        ),
        const SizedBox(
          width: 24,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text1,
                style: TextStyle(
                  color: colorText,
                  fontFamily: GoogleFonts.montserrat().fontFamily,
                  fontSize: 14,
                ),
              ),
              Text(
                text2,
                style: TextStyle(
                    color: colorText,
                    fontFamily: GoogleFonts.montserrat().fontFamily,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
