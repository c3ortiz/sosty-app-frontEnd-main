// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_first_app/foundation/sp_solid_button/sp_solid_button.dart';
import 'package:my_first_app/foundation/sp_text_field/sp_text_field.dart';
import 'package:http/http.dart';
import 'dart:convert';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumeberController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void register(String email, String password, String firstName,
      String lastName, String phoneNumber) async {
    try {
      Response response = await post(
          Uri.parse('https://pruebadessoc.getsandbox.com/api/User/Register'),
          headers: <String, String>{'Content-Type': 'application/json'},
          body: jsonEncode(<String, String>{
            'email': email,
            'password': password,
            'userType': "Inversionista",
            'firstName': firstName,
            'lastName': lastName,
            'phoneNumber': phoneNumber
          }));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    Title:
    const Text("RegisterPage");
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 90),
            child: Form(
              key: formKey,
              child: Column(children: [
                SPTextFormField(
                  labelText: "Nombre",
                  textEditingController: _firstNameController,
                ),
                SizedBox(
                  height: 15,
                ),
                SPTextFormField(
                  labelText: "Apellidos",
                  textEditingController: _lastNameController,
                ),
                SizedBox(
                  height: 15,
                ),
                SPTextFormField(
                  labelText: "Contraseña",
                  textEditingController: _passwordController,
                ),
                SizedBox(
                  height: 15,
                ),
                SPTextFormField(
                  labelText: "Email",
                  textEditingController: _emailController,
                ),
                SizedBox(
                  height: 15,
                ),
                SPTextFormField(
                  labelText: "Teléfono",
                  textEditingController: _phoneNumeberController,
                ),
                SizedBox(
                  height: 15,
                ),
                SPSolidButton(
                    text: "Registrar",
                    onPressed: () {
                      formKey.currentState!.validate();
                      register(
                          _emailController.text.toString(),
                          _passwordController.text.toString(),
                          _firstNameController.text.toString(),
                          _lastNameController.text.toString(),
                          _phoneNumeberController.text.toString());
                    }),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
