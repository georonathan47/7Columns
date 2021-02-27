import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:seven__columns/core/shared/clients.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference clientCollection =
      FirebaseFirestore.instance.collection('clients');

  Future updateUserData(String name, String email, String contact) async {
    return await clientCollection.doc(uid).set({
      'name': name,
      'email': email,
      'contact': contact,
    });
  }

  // Client list from snapshot
  // ignore: unused_element
  List<Client> _clientListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Client(
        contact: doc.data ?? '',
        email: doc.data ?? '',
        name: doc.data ?? 'New Member',
      );
    });
  }

  // get ClientInfo stream
  Stream<QuerySnapshot> get clients {
    return clientCollection.snapshots();
  }
}
