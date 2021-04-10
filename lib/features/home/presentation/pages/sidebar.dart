import 'package:flutter/material.dart';

import '../../../../core/usecases/auth_service.dart';
import '../../../settings/presentation/pages/edit_profile.dart';
import '../../../settings/presentation/pages/settings.dart';

class Sidebar extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("georonathan47"),
            accountEmail: Text("Nathan James"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Stack(
                  children: <Widget>[
                    Image.asset(
                      "assets/jonathan.jpg",
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 2),
                    // Positioned(
                    //   bottom: 0,
                    //   right: 0,
                    //   child: Container(
                    //     height: 30,
                    //     width: 30,
                    //     decoration: BoxDecoration(
                    //       shape: BoxShape.circle,
                    //       border: Border.all(
                    //         width: 4,
                    //         color: Theme.of(context).scaffoldBackgroundColor,
                    //       ),
                    //       color: Colors.amber[400],
                    //     ),
                    //     child: IconButton(
                    //       icon: Icon(Icons.edit),
                    //       color: Colors.black,
                    //       onPressed: () {},
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.amber[250],
              image: DecorationImage(
                image: AssetImage("assets/pesuedo.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person_outlined),
            title: Text(
              "Profile",
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Profile(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite_outline_outlined),
            title: Text(
              "Favourites",
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.share_outlined),
            title: Text(
              "Share",
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings_outlined),
            title: Text(
              "Settings",
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Settings(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications_outlined),
            title: Text(
              "Alerts",
              style: TextStyle(fontSize: 20),
            ),
            trailing: ClipOval(
              child: Container(
                color: Colors.red[300],
                width: 30,
                height: 30,
                child: Center(
                  child: Text(
                    "9+",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            onTap: () {},
          ),
          Divider(thickness: 3),
          ListTile(
            leading: Icon(Icons.exit_to_app_outlined),
            title: Text(
              "Logout",
              style: TextStyle(fontSize: 20),
            ),
            onTap: () async {
              await _auth.logout();
            },
          ),
          SizedBox(height: 250),
          Center(
            child: const Text(
              "Version Prototype",
              style: TextStyle(
                fontSize: 20,
                fontFamily: "mcLaren-Bold",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
