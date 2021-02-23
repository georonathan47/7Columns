import 'package:flutter/material.dart';
import 'package:seven__columns/features/login/presentation/pages/login_page.dart';
import 'package:seven__columns/features/signup/presentation/pages/signup_page.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIN = true;
  void toggleView() {
    setState(() => showSignIN = !showSignIN);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIN) {
      return Login(toggleView: toggleView);
    } else {
      return SignUp(toggleView: toggleView);
    }
  }
}
