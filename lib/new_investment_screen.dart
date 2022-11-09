import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:my_first_app/model/GetPublicTopProjects.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'foundation/sp_num_field/sp_num_field.dart';
import 'foundation/sp_solid_button/sp_solid_button.dart';

class NewInvestmentScreen extends StatefulWidget {
  final GetPublicTopProjects publicProjectInfo;
  final double? inversion;
  const NewInvestmentScreen(GetPublicTopProjects this.publicProjectInfo,
      {super.key, this.inversion});

  @override
  State<NewInvestmentScreen> createState() =>
      _NewInvestmentScreenState(this.publicProjectInfo, this.inversion);
}

class _NewInvestmentScreenState extends State<NewInvestmentScreen> {
  final formKey = GlobalKey<FormState>();
  final _controller = PageController();
  final GetPublicTopProjects publicProjectInfo;
  final double? inversion;
  final _simulacionInversion = TextEditingController();
  _NewInvestmentScreenState(this.publicProjectInfo, this.inversion);

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
                  Text('Inicia tu',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  Text(' inversión', style: TextStyle(fontSize: 30)),
                ])),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                  child: Column(children: [
                Text(publicProjectInfo.projectName,
                    style: TextStyle(
                        fontFamily: GoogleFonts.montserrat().fontFamily,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                SizedBox(
                  height: 10,
                ),
                Text(publicProjectInfo.locationAddress,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: GoogleFonts.montserrat().fontFamily,
                        fontSize: 17,
                        color: Colors.grey)),
                SizedBox(height: 20),
                Container(
                    height: 250,
                    child: PageView(
                        controller: _controller,
                        scrollDirection: Axis.horizontal,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CachedNetworkImage(
                              placeholder: (context, url) {
                                return LoadingAnimationWidget.inkDrop(
                                  color: Colors.white,
                                  size: 50,
                                );
                              },
                              imageUrl: publicProjectInfo.projectImageUrl1,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                width: 80.0,
                                height: 80.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.fill),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CachedNetworkImage(
                              placeholder: (context, url) {
                                return LoadingAnimationWidget.inkDrop(
                                  color: Colors.white,
                                  size: 50,
                                );
                              },
                              imageUrl: publicProjectInfo.projectImageUrl2,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                width: 80.0,
                                height: 80.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.fill),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CachedNetworkImage(
                              placeholder: (context, url) {
                                return LoadingAnimationWidget.inkDrop(
                                  color: Colors.white,
                                  size: 50,
                                );
                              },
                              imageUrl: publicProjectInfo.projectImageUrl3,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                width: 80.0,
                                height: 80.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.fill),
                                ),
                              ),
                            ),
                          )
                        ])),
                SizedBox(height: 20),
                SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    effect: ExpandingDotsEffect(
                        activeDotColor: Colors.grey.shade800)),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text('Rentabilidad: ',
                        style: TextStyle(
                            fontFamily: GoogleFonts.montserrat().fontFamily,
                            fontSize: 17,
                            color: Colors.black)),
                    Text(publicProjectInfo.projectProfitability,
                        style: TextStyle(
                            fontFamily: GoogleFonts.montserrat().fontFamily,
                            fontSize: 17,
                            color: Colors.black)),
                    Text('%',
                        style: TextStyle(
                            fontFamily: GoogleFonts.montserrat().fontFamily,
                            fontSize: 17,
                            color: Colors.black))
                  ],
                ),
                Row(
                  children: [
                    Text('Días restantes: ',
                        style: TextStyle(
                            fontFamily: GoogleFonts.montserrat().fontFamily,
                            fontSize: 17,
                            color: Colors.black)),
                    Text(publicProjectInfo.daysLeft,
                        style: TextStyle(
                            fontFamily: GoogleFonts.montserrat().fontFamily,
                            fontSize: 17,
                            color: Colors.black)),
                  ],
                ),
                Row(
                  children: [
                    Text('Cantidad de neoganaderos: ',
                        style: TextStyle(
                            fontFamily: GoogleFonts.montserrat().fontFamily,
                            fontSize: 17,
                            color: Colors.black)),
                    Text(publicProjectInfo.amountOfInvestors,
                        style: TextStyle(
                            fontFamily: GoogleFonts.montserrat().fontFamily,
                            fontSize: 17,
                            color: Colors.black)),
                  ],
                ),
                SizedBox(height: 20),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SPNumField(
                        labelText: "¿Cuánto quieres invertir?",
                        textEditingController: _simulacionInversion,
                        validator: (value) {
                          value = value?.replaceAll(',', '');
                          value = value?.replaceAll('\$', '');
                          if (double.parse(value!) <
                              double.parse(publicProjectInfo.investmentRequired
                                  .toString())) {
                            return "La inversión mínima es: " +
                                publicProjectInfo.investmentRequired.toString();
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      SPSolidButton(
                        text: "Participar",
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            setState(() {});
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ])),
            ),
          ],
        )),
      ),
    );
  }
}
