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
import 'package:timelines/timelines.dart';

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
      body: SingleChildScrollView(
        child: FutureBuilder<dynamic>(
          future: getProjectTracking(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              late final cards = cardbuilder(snapshot.data);
              return Flex(
                direction: Axis.vertical,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(12),
                                      child: Text("\$ " +
                                          dataInversionInicial(snapshot.data)),
                                    ),
                                    Container(
                                      decoration: const BoxDecoration(
                                          color:
                                              Color.fromRGBO(77, 208, 137, 1),
                                          borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(12),
                                              bottomLeft: Radius.circular(12))),
                                      padding: const EdgeInsets.all(12),
                                      child: const Text(
                                        "Inversión inicial",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(12),
                                      // ignore: prefer_interpolation_to_compose_strings
                                      child: Text("\$ " +
                                          dataInversionEstimada(snapshot.data)),
                                    ),
                                    Container(
                                      decoration: const BoxDecoration(
                                          color:
                                              Color.fromRGBO(77, 208, 137, 1),
                                          borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(12),
                                              bottomLeft: Radius.circular(12))),
                                      padding: const EdgeInsets.all(12),
                                      child: const Text(
                                        "Ganancia estimada",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "Animales",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily:
                                    GoogleFonts.montserrat().fontFamily),
                          ),
                          SfCircularChart(
                              series: <CircularSeries>[
                                // Renders doughnut chart
                                DoughnutSeries<ChartData, String>(
                                    explode: true,
                                    dataSource: dataListCircular(snapshot.data),
                                    dataLabelSettings: DataLabelSettings(
                                        isVisible: true,
                                        labelPosition:
                                            ChartDataLabelPosition.inside,
                                        textStyle: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w200,
                                            fontFamily: GoogleFonts.montserrat()
                                                .fontFamily)),
                                    pointColorMapper: (ChartData data, _) =>
                                        data.color,
                                    xValueMapper: (ChartData data, _) => data.x,
                                    yValueMapper: (ChartData data, _) =>
                                        data.y),
                              ],
                              legend: Legend(
                                  isVisible: true,
                                  textStyle: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w200,
                                      fontFamily:
                                          GoogleFonts.montserrat().fontFamily)))
                        ],
                      ),
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
                              pointColorMapper: (ChartData data, _) =>
                                  data.color,
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y)
                        ],
                      ),
                      Text(
                        "Actualizaciones y documentos",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: GoogleFonts.montserrat().fontFamily),
                      ),
                      for (var a = 0; a < cards.length; a++) cards[a]
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
          investmentInfo.weights!.last.cantidadDeAnimalesGanananDe0a7,
          Color.fromARGB(255, 34, 142, 37)),
      ChartData(
          "7 a 10 mensual",
          investmentInfo.weights!.last.cantidadDeAnimalesGanananDe7a10,
          Color.fromARGB(255, 53, 173, 225)),
      ChartData(
          "Mas de 10 mensual",
          investmentInfo.weights!.last.cantidadDeAnimalesGanananMasDe10,
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

  static dynamic dataInversionInicial(
      GetProjectProgressInformation investmentInfo) {
    return NumberFormat('#,##0', "es_CO")
        .format(investmentInfo.amountInvested)
        .toString();
  }

  static dynamic dataInversionEstimada(
      GetProjectProgressInformation investmentInfo) {
    var inversionEstimada;
    var duracionActual;
    var fechaInicial = DateTime.parse(investmentInfo.startDate.toString());
    var fechaFinal = DateTime.parse(investmentInfo.endDate.toString());
    var fechaActual = DateTime.now();

    if (fechaActual.compareTo(fechaFinal) < 0) {
      duracionActual =
          ((fechaActual.difference(fechaInicial).inDays) / 12).floor();
      inversionEstimada = (((investmentInfo.projectProfitability / 100) / 12) *
              duracionActual) *
          int.parse(investmentInfo.amountInvested.toString());
    } else if (fechaActual.compareTo(fechaFinal) > 0) {
      duracionActual = int.parse(investmentInfo.projectDuration.toString());
      inversionEstimada = (((investmentInfo.projectProfitability / 100) / 12) *
              duracionActual) *
          int.parse(investmentInfo.amountInvested.toString());
    } else if (fechaActual.compareTo(fechaFinal) == 0) {
      duracionActual = int.parse(investmentInfo.projectDuration.toString());
      inversionEstimada = (((investmentInfo.projectProfitability / 100) / 12) *
              duracionActual) *
          int.parse(investmentInfo.amountInvested.toString());
    }

    return NumberFormat('#,##0', "es_CO").format(inversionEstimada).toString();
  }

  static List<TimelineTile> cardbuilder(
      GetProjectProgressInformation investmentInfo) {
    List<TimelineTile> timeCards = [];
    for (var i = 0; i < investmentInfo.events!.length; i++) {
      timeCards!.add(TimelineTile(
        oppositeContents: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.centerRight,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Text(investmentInfo.events![i].eventType.toString()),
              Text(
                DateFormat('dd-MM-yyyy').format(DateTime.parse(
                    investmentInfo.events![i].eventDate.toString())),
                style: TextStyle(color: Colors.grey),
              ),
            ]),
          ),
        ),
        contents: Card(
          child: Container(
            padding: EdgeInsets.all(8.0),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(investmentInfo.events![i].description.toString()),
                  ],
                )),
          ),
        ),
        node: TimelineNode(
          indicator: DotIndicator(),
          startConnector: SolidLineConnector(),
          endConnector: SolidLineConnector(),
        ),
      ));
    }

    return timeCards;
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
