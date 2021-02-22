import 'package:cloud_firestore/cloud_firestore.dart';

class Transaction {
  final DocumentReference reference;
  final String account;
  final double amount;
  final String category;
  final DateTime date;
  final String description;
  final bool isCleared;

  Transaction.data({
    this.reference,
    this.account,
    this.amount,
    this.category,
    this.date,
    this.description,
    this.isCleared,
  });

  factory Transaction.from(DocumentSnapshot document) => Transaction.data(
        reference: document.reference,
        account: document.data()['account'],
        amount: document.data()['amount'].toDouble(),
        category: document.data()['category'],
        date: document.data()['date'].toDate(),
        description: document.data()['description'],
        isCleared: document.data()['isCleared'],
      );

  void save() {
    reference.set(toMap());
  }

  Map<String, dynamic> toMap() {
    return {
      'account': account,
      'amount': amount,
      'category': category,
      'date': date,
      'description': description,
      'isCleared': isCleared,
    };
  }
}
