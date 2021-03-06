import 'package:cloud_firestore/cloud_firestore.dart';

class Account {
  final String name;
  final double balance;
  final DateTime lastUpdated;

  Account({
    this.name,
    this.balance,
    this.lastUpdated,
  });

  factory Account.from(DocumentSnapshot document) => Account(
        name: document.data()['name'],
        balance: document.data()['balance'].toDouble(),
        lastUpdated: document.data()['lastUpdated'].toDate(),
      );
}
