import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/shared/clients.dart';
import 'client_tile.dart';

class ClientList extends StatefulWidget {
  @override
  _ClientListState createState() => _ClientListState();
}

class _ClientListState extends State<ClientList> {
  @override
  Widget build(BuildContext context) {
    final clients = Provider.of<List<Client>>(context);

    return ListView.builder(
      itemCount: clients.length,
      itemBuilder: (context, index) {
        return ClientTile();
      },
    );
  }
}
