import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_first_app/model/GetPublicTopProjects.dart';

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
  final GetPublicTopProjects publicProjectInfo;
  final double? inversion;
  _NewInvestmentScreenState(this.publicProjectInfo, this.inversion);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          ],
        )),
      ),
    );
  }
}
