import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seven__columns/core/shared/loading.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool loading = false;
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.amberAccent,
              elevation: 1.5,
              title: Text(
                'Login Page',
                style: GoogleFonts.mcLaren(
                  textStyle: TextStyle(
                    //decoration: new InputDecoration()
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              actions: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.person),
                  label: Text(
                    'Logout',
                    style: GoogleFonts.mcLaren(
                      textStyle: TextStyle(
                        fontSize: 18,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            body: new Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
              child: new Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Form(
                        key: _formkey,
                        child: Theme(
                          data: new ThemeData(
                            brightness: Brightness.dark,
                            primarySwatch: Colors.amber,
                            inputDecorationTheme: new InputDecorationTheme(
                              labelStyle: new TextStyle(
                                color: Colors.amberAccent,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(50.0),
                            child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                new TextFormField(
                                  validator: (val) => val.isEmpty
                                      ? 'Enter a valid email address'
                                      : null,
                                  decoration: new InputDecoration(
                                    hintText: 'Enter a valid email',
                                    labelText: 'Enter email',
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: (val) {},
                                ),
                                SizedBox(height: 15),
                                new TextFormField(
                                  validator: (val) => val.length < 8
                                      ? 'Enter a strong Password'
                                      : null,
                                  decoration: new InputDecoration(
                                    hintText: 'Password',
                                    labelText: 'Enter pasword',
                                  ),
                                  keyboardType: TextInputType.text,
                                  onChanged: (val) {},
                                  obscureText: true,
                                ),
                                new Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                ),
                                SizedBox(height: 15),
                                
                                new Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    RaisedButton(
                                      shape: new RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      color: Colors.amber[300],
                                      textColor: Colors.black,
                                      child: Text(
                                        'Login',
                                        style: GoogleFonts.mcLaren(
                                          textStyle:
                                              TextStyle(letterSpacing: 2.2),
                                        ),
                                      ),
                                      onPressed: () {},
                                      splashColor: Colors.amberAccent,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
