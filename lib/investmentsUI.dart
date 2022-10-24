import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_first_app/model/GetInvestmentsInProgressByInvestorDTO.dart';
import 'package:my_first_app/main_screen.dart';

class investmentsUI extends StatelessWidget {
  investmentsUI(
      this.projectName,
      this.projectImageUrl1,
      this.totalUnits,
      this.minimumInvestmentRequired,
      this.projectStatus,
      this.projectProfitability,
      this.startDate,
      this.endDate,
      {super.key});
  String projectName;
  String projectImageUrl1;
  int totalUnits;
  int minimumInvestmentRequired;
  String projectStatus;
  dynamic projectProfitability;
  dynamic startDate;
  dynamic endDate;

  @override
  Widget build(BuildContext context) {
    var imageData;
    var duration;
    DateTime dtStart = DateTime.parse(startDate);
    DateTime dtEnd = DateTime.parse(endDate);

    duration = dtEnd.difference(dtStart).inDays;

    return Column(children: [
      Container(
          width: 350,
          height: 115,
          decoration: BoxDecoration(
              color: Color.fromRGBO(0, 189, 86, 0.4),
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                  image: NetworkImage(projectImageUrl1), fit: BoxFit.fill))),
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
              projectName,
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.montserrat().fontFamily),
            ),
            SizedBox(height: 10),
            listProfile(
                Icons.grass, "Unidades totales", "${totalUnits.toString()}"),
            listProfile(Icons.monetization_on, "Inversión mínima",
                "${minimumInvestmentRequired.toString()}"),
            listProfile(Icons.label_sharp, "Estado", "${projectStatus}"),
            listProfile(
                Icons.keyboard_double_arrow_up,
                "Rentabilidad estimada*",
                "${projectProfitability.toString()} % (E.A)"),
            listProfile(Icons.watch, "Duración", "${duration} dias"),
            listProfile(Icons.people, "Neoganaderos", "${projectStatus}"),
          ],
        ),
      ),
    ]);
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
