import 'package:cloud_firestore/cloud_firestore.dart';

class Account {
  final DocumentReference docRef;
  final String name;
  final double balance;
  final DateTime lastUpdated;

  Account({
    this.docRef,
    this.name,
    this.balance,
    this.lastUpdated,
  });

  factory Account.from(DocumentSnapshot document) => Account(
        docRef: document.reference,
        name: document.data()['name'],
        balance: document.data()['balance'].toDouble(),
        lastUpdated: document.data()['lastUpdated'].toDate(),
      );
}
