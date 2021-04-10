import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../features/home/presentation/pages/homepage_main.dart';
import 'authentication/authenticate.dart';
import 'user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final person = Provider.of<Person>(context);
    print(person);
    if (person == null) {
      return Authenticate();
      //return Home();
    } else {
      return Home();
    }
  }
}
