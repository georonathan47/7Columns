import 'package:flutter/material.dart';
// import 'package:seven_columns/core/usecases/database.dart';

import '../../../../core/shared/clients.dart';

class ClientTile extends StatelessWidget {
  // final DatabaseService _database = DatabaseService.;
  final Client client;
  ClientTile({this.client});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: Container(
          height: 90,
          color: Colors.white,
          child: GridView.count(
            crossAxisCount: 1,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
            shrinkWrap: true,
            children: List.generate(
              12,
              (index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/esther.jpg"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
