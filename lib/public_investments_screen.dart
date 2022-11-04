import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
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
import 'package:intl/intl.dart';

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
                height: 575,
                child: PageView(
                    controller: _controller,
                    scrollDirection: Axis.horizontal,
                    children: [
                      for (var items in topProjects!)
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
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
                                      imageBuilder: (context, imageProvider) =>
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
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  width: 350,
                                  height: 350,
                                  child: DefaultTextStyle.merge(
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
                                        SizedBox(height: 10),
                                        listProfile(
                                            Icons.monetization_on,
                                            "Inversión mínima",
                                            "\$ " +
                                                NumberFormat('#,##0', "es_CO")
                                                    .format(int.parse(items
                                                        .investmentRequired
                                                        .toString()))
                                                    .toString(),
                                            items.projectStatus.toString()),
                                        listProfile(
                                            Icons.grass,
                                            "Unidades totales",
                                            items.amountOfCattles.toString(),
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
                                            "Ubicación",
                                            items.locationAddress.toString(),
                                            items.projectStatus.toString()),
                                      ],
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
              )
            ],
          ),
        )
      ],
    ),
  );
}
