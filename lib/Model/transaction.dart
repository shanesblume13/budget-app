import 'package:budget/Model/account.dart';
import 'package:budget/Model/category.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Transaction {
  DocumentReference docRef;
  final String description;
  final double amount;
  final DateTime clearedDate;
  final DocumentReference accountDocRef;
  Account account;
  final DocumentReference categoryDocRef;
  Category category;

  Transaction({
    this.docRef,
    this.description,
    this.amount,
    this.clearedDate,
    this.accountDocRef,
    this.account,
    this.categoryDocRef,
    this.category,
  });

  factory Transaction.fromDocument(DocumentSnapshot document) => Transaction(
        docRef: document.reference,
        description: document.data()['description'],
        amount: document.data()['amount'].toDouble(),
        clearedDate: document.data()['clearedDate'].toDate(),
        accountDocRef: document.data()['accountDocRef'],
        categoryDocRef: document.data()['categoryDocRef'],
      );
}
