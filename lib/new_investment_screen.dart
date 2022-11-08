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
          child: Text('hola inicia tu nueva inversion en ' +
              publicProjectInfo.projectName +
              ' con una inversion minima de ' +
              inversion.toString()),
        ),
      ),
    );
  }
}
