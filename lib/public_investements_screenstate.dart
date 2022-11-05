import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'foundation/sp_num_field/sp_num_field.dart';
import 'foundation/sp_solid_button/sp_solid_button.dart';
import 'package:intl/intl.dart';

class PublicInvestmentsScreenState extends StatefulWidget {
  const PublicInvestmentsScreenState(
      {super.key,
      required this.rentabilidad,
      this.inversionMinima,
      this.duracionEstimada});
  final dynamic rentabilidad;
  final dynamic inversionMinima;
  final dynamic duracionEstimada;

  @override
  State<PublicInvestmentsScreenState> createState() =>
      _PublicInvestmentsScreenStateState(
          this.rentabilidad, this.inversionMinima, this.duracionEstimada);
}

class _PublicInvestmentsScreenStateState
    extends State<PublicInvestmentsScreenState> {
  final _simulacionInversion = TextEditingController();

  String _estimacion = '';
  final dynamic rentabilidad;
  final dynamic inversionMinima;
  final dynamic duracionEstimada;

  _PublicInvestmentsScreenStateState(
      this.rentabilidad, this.inversionMinima, this.duracionEstimada);

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
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
                child: Text(
                  "Ganarás \$ " +
                      NumberFormat('#,##0', "es_CO")
                          .format(double.parse(_estimacion))
                          .toString() +
                      " COP en " +
                      duracionEstimada.toString() +
                      " meses aproximadamente",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
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
