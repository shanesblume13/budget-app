import 'package:cloud_firestore/cloud_firestore.dart';

class Transaction {
  final String account;
  final double amount;
  final DateTime clearedDate;
  final String category;
  final String description;

  Transaction(
      {this.account,
      this.amount,
      this.clearedDate,
      this.category,
      this.description});

  factory Transaction.from(DocumentSnapshot document) => Transaction(
        account: document.data()['account'],
        amount: document.data()['amount'].toDouble(),
        clearedDate: document.data()['clearedDate'].toDate(),
        category: document.data()['category'],
        description: document.data()['description'],
      );
}
