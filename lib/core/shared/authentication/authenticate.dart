import 'package:flutter/material.dart';

import '../../../features/login/presentation/pages/login_page.dart';
import '../../../features/signup/presentation/pages/signup_page.dart';

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
      return SignUp(toggleView: toggleView);
    } else {
      return Login(toggleView: toggleView);
    }
  }
}
