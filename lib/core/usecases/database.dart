import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:seven__columns/core/shared/clients.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference clientCollection =
      FirebaseFirestore.instance.collection('clients');

  Future updateUserData(String name, String email, int contact) async {
    return await clientCollection.doc(uid).set({
      'name': name,
      'email': email,
      'contact': contact,
    });
  }

  // Client list from snapshot
  List<Client> _clientListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Client(
        contact: doc.data() ?? '233',
        email: doc.data() ?? '',
        name: doc.data() ?? 'New Member',
      );
    });
  }

  // get ClientInfo stream
  Stream<List<Client>> get clients {
    return clientCollection.snapshots()
      .map(_clientListFromSnapshot);
  }
}
