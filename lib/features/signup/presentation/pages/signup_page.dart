import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/shared/loading.dart';
import '../../../../core/usecases/auth_service.dart';

class SignUp extends StatefulWidget {
  final Function toggleView;
  SignUp({this.toggleView});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool loading = false;
  final _formkey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  String email = "";
  String password = "";
  String error = "";

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
                'Sign Up Page',
                style: GoogleFonts.mcLaren(
                  textStyle: TextStyle(
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              actions: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.person),
                  label: Text(
                    'Sign In',
                    style: GoogleFonts.mcLaren(
                      textStyle: TextStyle(
                        fontSize: 18,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  onPressed: () {
                    widget.toggleView();
                  },
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
                          child: Column(
                            children: <Widget>[
                              Text(
                                "Welcome To Our Platform",
                                style: GoogleFonts.mcLaren(
                                  textStyle: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white54,
                                    letterSpacing: 1.5,
                                  ),
                                ),
                              ),
                              Container(
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
                                      onChanged: (val) {
                                        setState(() => email = val);
                                      },
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
                                      onChanged: (val) {
                                        setState(() => password = val);
                                      },
                                      obscureText: true,
                                    ),
                                    new Padding(
                                      padding: const EdgeInsets.only(top: 20.0),
                                    ),
                                    SizedBox(height: 15),
                                    new Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        RaisedButton(
                                          //! register button
                                          shape: new RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                          color: Colors.amber[300],
                                          textColor: Colors.black,
                                          child: Text(
                                            'Register',
                                            style: GoogleFonts.mcLaren(
                                              textStyle:
                                                  TextStyle(letterSpacing: 2.2),
                                            ),
                                          ),
                                          onPressed: () async {
                                            if (_formkey.currentState
                                                .validate()) {
                                              setState(() => loading = true);
                                              dynamic result = await _auth
                                                  .registerEmailandPassword(
                                                      email, password);
                                              if (result == null) {
                                                setState(() => error =
                                                        'Invalid email and/or password\n Please enter valid credentials'
                                                    // loading = false;
                                                    );
                                                setState(() => loading = false);
                                              }
                                            }
                                          },
                                          splashColor: Colors.amberAccent,
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          error,
                                          style: GoogleFonts.mcLaren(
                                            textStyle: TextStyle(
                                              color: Colors.red[500],
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
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
