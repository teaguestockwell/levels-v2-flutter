import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'model.dart';

class DatabaseService{
  // collection reference
  final CollectionReference glossaryCollection = FirebaseFirestore.instance.collection('glossary');

  // brew list from snapshot
  List<Glossary> _glossarylistFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc){
      //print(doc.data);
      return Glossary(doc.get('title'), doc.get('body'));
    }).toList();
  }

  // get brews stream
  Stream<List<Glossary>> get glossary {
    return glossaryCollection.snapshots()
        .map(_glossarylistFromSnapshot);
  }

//  Future<void> updateUserData(String sugars, String name, int strength) async {
//    return await brewCollection.document(uid).setData({
//      'sugars': sugars,
//      'name': name,
//      'strength': strength,
//    });
//  }


}