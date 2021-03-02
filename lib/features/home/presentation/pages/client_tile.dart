import 'package:flutter/material.dart';
import 'package:seven__columns/core/shared/clients.dart';

class ClientTile extends StatelessWidget {
  final Client client;
  ClientTile({this.client});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 5.0,
          shrinkWrap: true,
          children: List.generate(
            20,
            (index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('img.png'),
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
    );
  }
}
