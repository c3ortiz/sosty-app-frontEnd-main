import 'package:flutter/material.dart';
import 'package:my_first_app/model/GetInvestmentsInProgressByInvestorDTO.dart';

class investmentsUI extends StatelessWidget {
  investmentsUI(this.projectName, {super.key});
  String projectName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Container(
        width: 350,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Color.fromRGBO(0, 189, 86, 0.4),
            borderRadius: BorderRadius.circular(16)),
        child: Column(children: [
          Text(projectName),
          SizedBox(height: 80),
          Text('Con mucha rentabilidad'),
        ]),
      ),
    );
  }
}
