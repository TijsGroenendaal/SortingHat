import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class FireStoreHandler {
  static FirebaseFirestore firebaseApp;

  static void initializeFireStore() async {
    if (firebaseApp == null) {
      await Firebase.initializeApp();
      firebaseApp = FirebaseFirestore.instance;
    }
  }
}