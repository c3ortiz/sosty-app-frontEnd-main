// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';
import 'package:my_first_app/main_screen.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:my_first_app/user.dart';

import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void logIn(String email, String password) async {
    try {
      Response response = await post(
          Uri.parse('https://sosty-api.azurewebsites.net/api/User/Login'),
          headers: <String, String>{'Content-Type': 'application/json'},
          body: jsonEncode(<String, String>{
            'email': email,
            'password': password,
          }));

      if (response.statusCode == 200) {
        Map<dynamic, dynamic> map = json.decode(response.body);
        var user = User.fromJson(map);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => new MainScreen(user: user)));
      } else {}
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  //Hola de nuevo

                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                        child: Image(
                            image: AssetImage("assets/images/sostyLogo.png"))),
                  ),

                  const SizedBox(height: 10),
                  const Text(
                    'Bienvenido de vuelta, te extrañabamos',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 40),

                  //email
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email',
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  //password
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // sign in button
                  Center(
                    child: ElevatedButton(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 80.0),
                        child: Text(
                          'Entrar',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      onPressed: () {
                        logIn(_emailController.text.toString(),
                            _passwordController.text.toString());
                      },
                    ),
                  ),

                  const SizedBox(height: 25),

                  //register buttom
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text(
                        '¿Aún no usas Sosty?',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      new GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterScreen()));
                        },
                        child: new Text(
                          ' Regístrate',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
