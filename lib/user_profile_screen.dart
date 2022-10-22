import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_first_app/model/user_information.dart';
import 'package:my_first_app/user.dart';

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

  _UserProfileScreenState(this.user, this.userInformation);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color.fromRGBO(77, 208, 137, 1),
        child: Icon(Icons.add, size: 35),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1, color: Colors.black),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 6, bottom: 6),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => new MainScreen(
                                      user: user,
                                    )));
                      },
                      icon: Icon(Icons.home, size: 33, color: Colors.grey)),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.person, size: 33, color: Colors.black))
                ]),
          )),
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
                    image: const DecorationImage(
                      image: AssetImage(
                        "assets/images/profile.png",
                      ),
                    ),
                  ),
                ),
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
                    " ${userInformation.profileDetails![0].firstName} ${userInformation.profileDetails![0].lastName}"),
                listProfile(Icons.date_range, "Fecha de nacimiento",
                    "${userInformation.profileDetails![0].birthDate}"),
                listProfile(
                    Icons.location_pin, "Ubicación", "Bogotá, Colombia"),
                listProfile(Icons.phone_iphone, "Teléfono", "3107833059"),
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
