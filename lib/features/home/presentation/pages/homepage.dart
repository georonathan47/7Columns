import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        elevation: 1.5,
        titleSpacing: 2.0,
        title: Text(
          'Home',
          style: GoogleFonts.mcLaren(
            textStyle: TextStyle(
              letterSpacing: 1.5,
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.black,
        height: MediaQuery.of(context).size.height, // complete height of app
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.amber[500],
        backgroundColor: Colors.black,
        buttonBackgroundColor: Colors.amber[500],
        height: 40,
        index: 2, //sets default selected icon
        items: <Widget>[
          Icon(
            Icons.person,
            size: 20,
            color: Colors.black,
          ),
          Icon(
            Icons.favorite,
            size: 20,
            color: Colors.black,
          ),
          Icon(
            Icons.home,
            size: 20,
            color: Colors.black,
          ),
          Icon(
            Icons.settings,
            size: 20,
            color: Colors.black,
          ),
          Icon(
            Icons.exit_to_app,
            size: 20,
            color: Colors.black,
          ),
        ],
        animationDuration: Duration(microseconds: 200),
        animationCurve: Curves.bounceInOut,
        onTap: (index) {
          debugPrint("Current index $index");
        },
      ),
    );
  }
}
