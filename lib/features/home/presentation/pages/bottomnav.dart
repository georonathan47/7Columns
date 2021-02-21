import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      color: Colors.amber[500],
      backgroundColor: Colors.black,
      buttonBackgroundColor: Colors.amber[500],
      height: 45,
      index: 2, //sets default selected icon
      items: <Widget>[
        Icon(
          //! registered architects
          Icons.architecture,
          size: 20,
          color: Colors.white,
        ),
        Icon(
          //! favorited works by user
          Icons.favorite,
          size: 20,
          color: Colors.white,
        ),
        Icon(
          //! see all[most] works, like, leave a review
          Icons.home_outlined,
          size: 20,
          color: Colors.white,
        ),
        Icon(
          //! user reviews section
          Icons.book,
          size: 20,
          color: Colors.white,
        ),
        Icon(
          //! settings, edit profile, etc.
          Icons.settings,
          size: 20,
          color: Colors.white,
        ), 
      ],
      animationDuration: Duration(microseconds: 200),
      animationCurve: Curves.bounceInOut,
      onTap: (index) {
        debugPrint("Current index $index");
      },
    );
  }
}
