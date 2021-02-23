import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seven__columns/core/shared/wrapper.dart';
import 'package:seven__columns/core/usecases/auth_service.dart';
import 'core/shared/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Person>.value(
      value: AuthService().user,
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.amber,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Wrapper(),
      ),
    );
  }
}
