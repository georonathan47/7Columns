import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/usecases/database.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final bool showPassword = false;

  final DatabaseService _db = DatabaseService();
  final imagePicker = ImagePicker();
  File _image;
  Future getImage() async {
    final image = await imagePicker.getImage(source: ImageSource.gallery);
    // ignore: missing_return
    setState((_) {
      _image = File(image.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.amber[500],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: new Container(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 25,
        ),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: <Widget>[
              Text(
                'Edit Profile',
                style: GoogleFonts.mcLaren(
                  textStyle: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              new Center(
                child: new Stack(
                  children: [
                    Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 5,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 12,
                            spreadRadius: 4,
                            color: Colors.amberAccent.withOpacity(0.5),
                            offset: Offset(0, 15),
                          ),
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage("jonathan.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 5,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          color: Colors.amber[400],
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Colors.amber[500],
                          ),
                          color: Colors.black,
                          onPressed: getImage,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              buildTextField("Full Name", "Asare Prince Kofi", false),
              buildTextField("E-mail", "example@gmail.com", false),
              buildTextField("Password", "*********", true),
              buildTextField("Contact", "020 xxx xxxx", false),
              SizedBox(
                height: 35,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "CANCEL",
                    style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 2.2,
                      color: Colors.red[250],
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await _db.updateUserData(
                      "",
                      "",
                      "",
                      233,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 2,
                    primary: Colors.green[250], //!elevatedButton background
                  ),
                  child: Text(
                    "SAVE",
                    style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 2.2,
                      color: Colors.white,
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildTextField(
    String labelText, String placeholder, bool isPasswordTextField) {
  var showPassword;
  return Padding(
    padding: const EdgeInsets.only(top: 25, left: 35, right: 35, bottom: 10),
    child: TextField(
      obscureText: isPasswordTextField ? showPassword : false,
      decoration: InputDecoration(
        suffixIcon: isPasswordTextField
            ? IconButton(
                onPressed: () {
                  setState(
                    (_) => showPassword = !showPassword,
                  );
                },
                icon: Icon(
                  Icons.remove_red_eye,
                  color: Colors.cyan,
                ),
              )
            : null, //!This makes the icon appear only for the password field
        contentPadding: EdgeInsets.only(bottom: 3),
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: placeholder,
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.amber[500],
        ),
      ),
    ),
  );
}

void setState(bool Function(State) param0) {}

//void setState(bool Function(_ProfileState) param0) {}
