import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClientList extends StatefulWidget {
  @override
  _ClientListState createState() => _ClientListState();
}

class _ClientListState extends State<ClientList> {
  @override
  Widget build(BuildContext context) {
    final clients = Provider.of<QuerySnapshot>(context);
    // for (var doc in clients.docs) {
    //   print(doc.data);
    // }
    return Container();
  }
}
