// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_first_app/foundation/sp_solid_button/sp_solid_button.dart';
import 'package:my_first_app/foundation/sp_text_field/sp_text_field.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

import 'login_screen.dart';

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

  final RegExp _email = RegExp(
      r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$");

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
      if (response.statusCode == 200) {
        Fluttertoast.showToast(
            msg:
                "Tu cuenta fue creada exitosamente, por favor revisa tu correo para activarla", // message
            toastLength: Toast.LENGTH_LONG, // length
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 30
            // location           // duration
            );
      }
      if (response.statusCode == 400) {
        Fluttertoast.showToast(
          msg: Utf8Decoder().convert(response.bodyBytes), // message
          toastLength: Toast.LENGTH_SHORT, // length
          gravity: ToastGravity.CENTER,
          // location           // duration
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    Title:
    const Text("RegisterPage");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(250, 250, 250, 100),
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Color.fromRGBO(88, 89, 91, 100),
          onPressed: () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginScreen())),
        ),
        title: const Text(
          "Completa tu registro",
          style: TextStyle(
              color: Color.fromRGBO(88, 89, 91, 100),
              fontWeight: FontWeight.w600,
              fontSize: 22),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
            child: Form(
              key: formKey,
              child: Column(children: [
                SPTextFormField(
                  labelText: "Nombre",
                  textEditingController: _firstNameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Nombre no puede estar vacío";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                SPTextFormField(
                  labelText: "Apellidos",
                  textEditingController: _lastNameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Apellidos no puede estar vacío";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                SPTextFormField(
                  labelText: "Contraseña",
                  textEditingController: _passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Contraseña no puede estar vacía";
                    } else if (value.length < 8) {
                      return "Mínimo 8 caracteres";
                    }

                    return null;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                SPTextFormField(
                  labelText: "Email",
                  textEditingController: _emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Email no puede estar vacío";
                    } else if (!(_email.hasMatch(value))) {
                      return "Debe ser un email válido";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                SPTextFormField(
                  labelText: "Teléfono",
                  textEditingController: _phoneNumeberController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Teléfono no puede estar vacío";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                SPSolidButton(
                    text: "Registrar",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        register(
                            _emailController.text.toString(),
                            _passwordController.text.toString(),
                            _firstNameController.text.toString(),
                            _lastNameController.text.toString(),
                            _phoneNumeberController.text.toString());
                      }
                    }),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
