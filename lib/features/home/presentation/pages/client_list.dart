import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/shared/clients.dart';
import 'client_tile.dart';

class ClientList extends StatefulWidget {
  ClientList(ClientTile clientTile);

  @override
  _ClientListState createState() => _ClientListState();
}

class _ClientListState extends State<ClientList> {
  @override
  Widget build(BuildContext context) {
    final clients = Provider.of<List<Client>>(context);

    return ListView.builder(
      itemCount: clients?.length ?? 0,
      //itemCount: clients.length,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            ClientTile(
              client: clients[index],
            ),
          ],
        );
      },
    );
  }
}
