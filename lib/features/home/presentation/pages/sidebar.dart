import 'package:flutter/material.dart';
import 'package:seven__columns/core/usecases/auth_service.dart';

class Sidebar extends StatefulWidget {
  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colors.amber[600],
          ),
          Center(
            child: Column(
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.only(
                    top: 30,
                    bottom: 10,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 0.5,
                      color: Colors.amberAccent,
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 3,
                        color: Colors.amber[600].withOpacity(0.8),
                        offset: Offset(0, 15),
                      ),
                    ],
                    image: DecorationImage(
                      image: new AssetImage(
                        "",
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Text(
                  //!This field will be the name of the user in Version 1.0
                  'New Client',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.amber[300],
                  ),
                ),
                Text(
                  //!This field will be the email of the user in Version 1.0
                  'example@dev.com',
                  style: TextStyle(
                    color: Colors.amber[300],
                  ),
                ),
              ],
            ),
          ),
          new Column(
            children: <Widget>[
              ListView(
                children: [
                  Column(
                    children: <Widget> [
                      ListTile(
                        leading: Icon(Icons.person),
                        title: Text(
                          'Profile',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                //builder: (context) => Profile(),
                                ),
                          );
                        },
                      ),
                      ListTile(
                          leading: Icon(Icons.phone),
                          title: Text(
                            'Contact Us',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          onTap: () {
                            //!page navigations
                            Navigator.of(context).pop();
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  // builder: (context) => Contact(), //Login(),
                                  ),
                            );
                          }),
                      ListTile(
                        leading: Icon(Icons.arrow_back),
                        title: Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        onTap: () async {
                          await _auth.logout();
                          // this.toggleView();
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.question_answer),
                        title: Text(
                          "FAQs",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: Icon(Icons.settings),
                        title: Text(
                          'Settings',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                // builder: (context) => Settings(),
                                ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 310,
                      ),
                      Text(
                        'Version 1.0.0',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
