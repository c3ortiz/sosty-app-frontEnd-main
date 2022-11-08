import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_first_app/new_investment_screen.dart';

import 'foundation/sp_num_field/sp_num_field.dart';
import 'foundation/sp_solid_button/sp_solid_button.dart';
import 'package:intl/intl.dart';

import 'model/GetPublicTopProjects.dart';

class PublicInvestmentsScreenState extends StatefulWidget {
  const PublicInvestmentsScreenState(
      {super.key,
      required this.rentabilidad,
      this.inversionMinima,
      this.duracionEstimada,
      required this.publicProjectInfo});
  final GetPublicTopProjects publicProjectInfo;
  final dynamic rentabilidad;
  final dynamic inversionMinima;
  final dynamic duracionEstimada;

  @override
  State<PublicInvestmentsScreenState> createState() =>
      _PublicInvestmentsScreenStateState(this.rentabilidad,
          this.inversionMinima, this.duracionEstimada, this.publicProjectInfo);
}

class _PublicInvestmentsScreenStateState
    extends State<PublicInvestmentsScreenState> {
  final _simulacionInversion = TextEditingController();

  String _estimacion = '';
  final dynamic rentabilidad;
  final dynamic inversionMinima;
  final dynamic duracionEstimada;
  final GetPublicTopProjects publicProjectInfo;

  _PublicInvestmentsScreenStateState(this.rentabilidad, this.inversionMinima,
      this.duracionEstimada, this.publicProjectInfo);

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 16,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: ListView(shrinkWrap: true, children: [
            Center(
                child: Text(
              'Simula tu inversión',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            )),
            SizedBox(
              height: 15,
            ),
            SPNumField(
              labelText: "¿Cuánto quieres invertir?",
              textEditingController: _simulacionInversion,
              validator: (value) {
                value = value?.replaceAll(',', '');
                value = value?.replaceAll('\$', '');
                if (double.parse(value!) <
                    double.parse(inversionMinima.toString())) {
                  return "La inversión mínima es: " +
                      inversionMinima.toString();
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            SPSolidButton(
              text: "calcular",
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  setState(() {
                    _estimacion = estimar(_simulacionInversion.text).toString();
                  });
                }
              },
            ),
            if (_estimacion.isNotEmpty)
              Container(
                color: Color.fromARGB(122, 83, 241, 128),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: "Ganarás \$ " +
                          NumberFormat('#,##0', "es_CO")
                              .format(double.parse(_estimacion))
                              .toString() +
                          " COP en " +
                          duracionEstimada.toString() +
                          " meses aproximadamente",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black,
                          fontFamily: GoogleFonts.montserrat().fontFamily),
                    ),
                    TextSpan(
                        text: ' empieza aquí',
                        style: TextStyle(
                            fontFamily: GoogleFonts.montserrat().fontFamily,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 254, 167, 81)),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      NewInvestmentScreen(publicProjectInfo,
                                          inversion: double.parse(
                                              _simulacionInversion.text
                                                  .replaceAll(',', '')
                                                  .replaceAll('\$', ''))),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    const begin = Offset(0.0, 1.0);
                                    const end = Offset.zero;
                                    const curve = Curves.ease;

                                    var tween = Tween(begin: begin, end: end)
                                        .chain(CurveTween(curve: curve));

                                    return SlideTransition(
                                      position: animation.drive(tween),
                                      child: child,
                                    );
                                  },
                                ));
                          }),
                  ]),
                ),
              )
          ]),
        ),
      ),
    );
  }

  double estimar(String valor) {
    valor = valor.replaceAll(',', '');
    valor = valor.replaceAll('\$', '');

    var finalEstimation;
    if (valor.isEmpty) {
      finalEstimation = 0.0;
    } else {
      finalEstimation = (int.parse(valor) *
              ((double.parse(rentabilidad) / 1200) *
                  double.parse(duracionEstimada))) +
          int.parse(valor);
    }

    return finalEstimation;
  }
}
