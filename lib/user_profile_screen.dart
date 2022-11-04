import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:my_first_app/model/user_information.dart';
import 'package:my_first_app/public_investments_screen.dart';
import 'package:my_first_app/user.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'main_screen.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen(
      {super.key, required this.user, this.userInformation});
  final User user;
  final UserInformation? userInformation;

  @override
  State<UserProfileScreen> createState() =>
      _UserProfileScreenState(user, userInformation!);
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final User user;
  final UserInformation userInformation;

  var imgFile = File('assets/images/profile.png');

  int _selectedIndex = 1;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 1: Business',
      style: optionStyle,
    )
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      Navigator.pop(context);
    });
  }

  _UserProfileScreenState(this.user, this.userInformation);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromRGBO(77, 208, 137, 1),
        onTap: _onItemTapped,
      ),
      backgroundColor: const Color.fromRGBO(77, 208, 137, 1),
      body: SizedBox(
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Expanded(
            flex: 4,
            child: Column(
              children: [
                Container(
                    height: 120,
                    width: 120,
                    margin: const EdgeInsets.only(top: 100, bottom: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(2, 2),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: CachedNetworkImage(
                      placeholder: (context, url) {
                        return LoadingAnimationWidget.inkDrop(
                          color: Colors.white,
                          size: 50,
                        );
                      },
                      errorWidget: (context, url, error) =>
                          Image.asset('assets/images/profile.png'),
                      imageUrl: "${userInformation.profilePictureUrl}",
                      imageBuilder: (context, imageProvider) => Container(
                        width: 80.0,
                        height: 80.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.fill),
                        ),
                      ),
                    )),
                Text(
                  userInformation.profileDetails![0].firstName!,
                  style: TextStyle(
                      fontFamily: GoogleFonts.montserrat().fontFamily,
                      color: Colors.black87,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  userInformation.userType.toString(),
                  style: TextStyle(
                      fontFamily: GoogleFonts.montserrat().fontFamily,
                      color: Colors.black54,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Container(
            height: 505,
            padding: const EdgeInsets.only(top: 20, left: 24, right: 24),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Información",
                  style: TextStyle(
                      fontFamily: GoogleFonts.montserrat().fontFamily,
                      color: Colors.black54,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 16,
                ),
                listProfile(Icons.person, "Nombre completo",
                    " ${userInformation.profileDetails![0].firstName} ${userInformation.profileDetails![0].lastName ?? "Sin definir"}"),
                listProfile(Icons.date_range, "Fecha de nacimiento",
                    "${userInformation.profileDetails![0].birthDate ?? "Sin definir"}"),
                listProfile(
                    Icons.location_pin, "Ubicación", "Bogotá, Colombia"),
                listProfile(Icons.phone_iphone, "Teléfono",
                    "${userInformation.profileDetails![0].contactPhone ?? "Sin definir"}"),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget listProfile(IconData icon, String text1, String text2) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 20,
          ),
          const SizedBox(
            width: 24,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text1,
                style: TextStyle(
                  color: Colors.black87,
                  fontFamily: GoogleFonts.montserrat().fontFamily,
                  fontSize: 14,
                ),
              ),
              Text(
                text2,
                style: TextStyle(
                    color: Colors.black87,
                    fontFamily: GoogleFonts.montserrat().fontFamily,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }
}
