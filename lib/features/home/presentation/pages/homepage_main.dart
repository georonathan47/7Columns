import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../core/usecases/auth_service.dart';
import '../../../../core/usecases/database.dart';
import 'bottomnav.dart';
//import 'client_list.dart';
import 'sidebar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  final String title = "";
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().clients,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          //centerTitle: true,
          backgroundColor: Colors.amberAccent,
          elevation: 0.5,
          title: Text(
            "Home",
            style: GoogleFonts.mcLaren(
              textStyle: TextStyle(
                letterSpacing: 1.5,
                color: Colors.black,
              ),
            ),
          ),
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.exit_to_app),
              label: Text(
                'Logout',
                style: GoogleFonts.mcLaren(
                  textStyle: TextStyle(
                    fontSize: 18,
                    letterSpacing: 1,
                    //color: Colors.white,
                  ),
                ),
              ),
              onPressed: () async {
                await _auth.logout();
              },
            ),
          ],
        ),
        drawer: Sidebar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                "Sample Designs",
                style: GoogleFonts.mcLaren(
                  textStyle: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    //return ClientList();
                    return Container();
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNav(),
      ),
    );
  }
}
