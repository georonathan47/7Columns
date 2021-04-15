import 'package:firebase_core/firebase_core.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/shared/user.dart';
import 'core/shared/wrapper.dart';
import 'core/usecases/auth_service.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Person>.value(
      value: AuthService().user,
      child: MaterialApp(
        // theme: ThemeData(
        //   primarySwatch: Colors.amber,
        //   visualDensity: VisualDensity.adaptivePlatformDensity,
        // ),
        theme: FlexColorScheme.light(scheme: FlexScheme.gold).toTheme,
        darkTheme: FlexColorScheme.dark(scheme: FlexScheme.amber).toTheme,
        home: Wrapper(),
      ),
    );
  }
}
