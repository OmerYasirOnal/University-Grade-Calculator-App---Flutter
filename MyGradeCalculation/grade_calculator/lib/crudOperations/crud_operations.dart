import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Crudoperations with ChangeNotifier {
  final _firestore = FirebaseFirestore.instance;

  get firestore => _firestore;

  // Define the methods for CRUD operations
  Future<void> addData(Map<String, dynamic> data, String collectionName) async {
    await _firestore.collection(collectionName).add(data);
  }

  Future<void> updateData(Map<String, dynamic> data, String documentId,
      String collectionName) async {
    await _firestore.collection(collectionName).doc(documentId).update(data);
  }

  Future<void> deleteData(String documentId, String collectionName) async {
    await _firestore.collection(collectionName).doc(documentId).delete();
  }

  Future<List<DocumentSnapshot>> getDocuments(String collectionName) async {
    QuerySnapshot querySnapshot =
        await _firestore.collection(collectionName).get();
    return querySnapshot.docs;
  }

  void listenToCollection(String collectionName) {
    _firestore.collection(collectionName).snapshots().listen((event) {
      if (kDebugMode) {
        print('Collection data changed');
      }
    });
  }

  void listenToDocument(String documentId, String collectionName) {
    _firestore
        .collection(collectionName)
        .doc(documentId)
        .snapshots()
        .listen((event) {
      if (kDebugMode) {
        print('Document data changed');
      }
      // Do something with the updated data
    });
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
