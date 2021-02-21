import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seven__columns/core/shared/loading.dart';
import 'package:seven__columns/features/home/presentation/pages/homepage_main.dart';

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
                    letterSpacing: 1.5,
                    //color: Colors.white,
                  ),
                ),
              ),
              actions: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.person),
                  label: Text(
                    'Sign Up',
                    style: GoogleFonts.mcLaren(
                      textStyle: TextStyle(
                        fontSize: 18,
                        letterSpacing: 1,
                        //color: Colors.white,
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
                                      ? 'Enter a registered email address'
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
                                      ? 'Enter your Password'
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
                                new Text(
                                  '\t\t\t\tLogin to your account, OR \nSign Up to create a new account',
                                  style: GoogleFonts.mcLaren(
                                    textStyle: TextStyle(
                                      color: Colors.amber[500],
                                      letterSpacing: 2.5,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    //! Signup button
                                    RaisedButton(
                                      shape: new RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      color: Colors.amber[300],
                                      textColor: Colors.black,
                                      child: Text(
                                        'Sign Up',
                                        style: GoogleFonts.mcLaren(
                                          textStyle: TextStyle(
                                            letterSpacing: 2.2,
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) => Home(),
                                            ),
                                          );
                                      },
                                      splashColor: Colors.amberAccent,
                                    ),
                                    //! Login button
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
                                      onPressed: () {
                                        if (_formkey.currentState.validate()) {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) => Home(),
                                            ),
                                          );
                                        }
                                      },
                                      splashColor: Colors.amberAccent,
                                    ),
                                  ],
                                )
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
