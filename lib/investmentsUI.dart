import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_first_app/model/GetInvestmentsInProgressByInvestorDTO.dart';
import 'package:my_first_app/main_screen.dart';
import 'package:my_first_app/project_tracking_screen.dart';
import 'package:my_first_app/user.dart';

class investmentsUI extends StatelessWidget {
  investmentsUI(this.project, this.user, {super.key});
  Project project;
  User user;
  @override
  Widget build(BuildContext context) {
    var duration;
    DateTime dtStart = DateTime.parse(project.startDate.toString());
    DateTime dtEnd = DateTime.parse(project.endDate.toString());

    duration = dtEnd.difference(dtStart).inDays;

    return InkWell(
        onTap: () {
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
                    return ProjectTrackingScreen(user: user);
                  }));
        },
        child: Column(children: [
          Container(
              width: 350,
              height: 115,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 189, 86, 0.4),
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                      image: NetworkImage(project.projectImageUrl1.toString()),
                      fit: BoxFit.fill))),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            width: 350,
            height: 350,
            child: Column(
              children: [
                Text(
                  project.projectName.toString(),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.montserrat().fontFamily),
                ),
                SizedBox(height: 10),
                listProfile(Icons.grass, "Unidades totales",
                    project.totalUnits.toString()),
                listProfile(Icons.monetization_on, "Inversión mínima",
                    project.minimumInvestmentRequired.toString()),
                listProfile(
                    Icons.label_sharp, "Estado", "${project.projectStatus}"),
                listProfile(
                    Icons.keyboard_double_arrow_up,
                    "Rentabilidad estimada*",
                    "${project.projectProfitability.toString()} % (E.A)"),
                listProfile(Icons.watch, "Duración", "${duration} dias"),
                listProfile(
                    Icons.people, "Neoganaderos", "${project.projectStatus}"),
              ],
            ),
          ),
        ]));
  }

  Widget listProfile(IconData icon, String text1, String text2) {
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text1,
                style: TextStyle(
                  color: Colors.black87,
                  fontFamily: GoogleFonts.montserrat().fontFamily,
                  fontSize: 14,
                ),
              ),
              Text(
                text2,
                style: TextStyle(
                    color: Colors.black87,
                    fontFamily: GoogleFonts.montserrat().fontFamily,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }
}
