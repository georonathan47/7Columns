import 'package:cloud_firestore/cloud_firestore.dart';

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

  // get ClientInfo stream
  Stream<QuerySnapshot> get clients {
    return clientCollection.snapshots();
  }
}
