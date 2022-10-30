// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:my_first_app/login_screen.dart';
import 'package:my_first_app/main_screen.dart';
import 'package:my_first_app/model/GetProjectProgressInformation.dart';
import 'package:my_first_app/user.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_charts/charts.dart';

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

    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);
      investmentInfo = GetProjectProgressInformation.fromJson(map);
      return investmentInfo;
    }
    setState(() {});
  }

  bool isPressed = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<dynamic>(
        future: getProjectTracking(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: [
                Text(
                  "Animales",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.montserrat().fontFamily),
                ),
                SfCircularChart(
                    series: <CircularSeries>[
                      // Renders doughnut chart
                      DoughnutSeries<ChartData, String>(
                          explode: true,
                          dataSource: dataListCircular(snapshot.data),
                          dataLabelSettings: DataLabelSettings(
                              isVisible: true,
                              labelPosition: ChartDataLabelPosition.inside,
                              textStyle: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w200,
                                  fontFamily:
                                      GoogleFonts.montserrat().fontFamily)),
                          pointColorMapper: (ChartData data, _) => data.color,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y),
                    ],
                    legend: Legend(
                        isVisible: true,
                        textStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w200,
                            fontFamily: GoogleFonts.montserrat().fontFamily))),
                Text(
                  "Evolución Peso Lote",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.montserrat().fontFamily),
                ),
                SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  series: <ChartSeries>[
                    ColumnSeries<ChartData, String>(
                        dataSource: dataListBars(snapshot.data),
                        pointColorMapper: (ChartData data, _) => data.color,
                        xValueMapper: (ChartData data, _) => data.x,
                        yValueMapper: (ChartData data, _) => data.y)
                  ],
                )
              ],
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return Center(
              child: LoadingAnimationWidget.inkDrop(
                  color: Colors.white, size: 25));
        },
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

  static List<ChartData> dataListCircular(
      GetProjectProgressInformation investmentInfo) {
    List<ChartData> list = [
      ChartData(
          "0 a 7 mensual",
          investmentInfo.weights![0].cantidadDeAnimalesGanananDe0a7,
          Color.fromARGB(255, 34, 142, 37)),
      ChartData(
          "7 a 10 mensual",
          investmentInfo.weights![0].cantidadDeAnimalesGanananDe7a10,
          Color.fromARGB(255, 53, 173, 225)),
      ChartData(
          "Mas de 10 mensual",
          investmentInfo.weights![0].cantidadDeAnimalesGanananMasDe10,
          Color.fromARGB(255, 230, 143, 36))
    ];

    return list;
  }

  static List<ChartData> dataListBars(
      GetProjectProgressInformation investmentInfo) {
    List<ChartData> list = [];
    List<DateTime> listDates = [];

    for (int i = 0; i < investmentInfo.weights!.length; i++) {
      listDates.add(
          DateTime.parse(investmentInfo.weights![i].weightDate.toString()));
    }

    for (int i = 0; i < investmentInfo.weights!.length; i++) {
      list.add(ChartData(
          DateFormat('dd-MM-yyyy').format(listDates[i]),
          investmentInfo.weights![i].pesoManada,
          Colors.primaries[Random().nextInt(Colors.primaries.length)]));
    }

    return list;
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final int y;
  final Color color;
}

/*Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => MainScreen(user: user))););*/
