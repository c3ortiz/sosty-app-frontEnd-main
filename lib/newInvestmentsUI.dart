import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_first_app/model/GetInvestmentsInProgressByInvestorDTO.dart';
import 'package:my_first_app/main_screen.dart';
import 'package:my_first_app/project_tracking_screen.dart';
import 'package:my_first_app/user.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'model/GetPublicTopProjects.dart';

class newInvestmentsUI extends StatelessWidget {
  newInvestmentsUI(this.project, this.investment, this.user, this.topProjects,
      {super.key});
  List<GetPublicTopProjects>? topProjects = [];
  Project project;
  Investment investment;
  User user;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
              context,
              PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 200),
                  transitionsBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secAnimation,
                      Widget child) {
                    animation = CurvedAnimation(
                        parent: animation, curve: Curves.elasticIn);
                    return ScaleTransition(
                        scale: animation,
                        child: child,
                        alignment: Alignment.center);
                  },
                  pageBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secAnimation) {
                    return ProjectTrackingScreen(
                      user: user,
                      investment: investment,
                    );
                  }));
        },
        child: Column(children: [
          Container(
              width: 350,
              height: 115,
              child: CachedNetworkImage(
                placeholder: (context, url) {
                  return LoadingAnimationWidget.inkDrop(
                    color: Colors.white,
                    size: 50,
                  );
                },
                imageUrl: project.projectImageUrl1.toString(),
                imageBuilder: (context, imageProvider) => Container(
                  width: 80.0,
                  height: 80.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image:
                        DecorationImage(image: imageProvider, fit: BoxFit.fill),
                  ),
                ),
              )),
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
