import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddTransaction extends StatelessWidget {
  final String account;
  final DateTime date;
  final String description;
  final double amount;
  final String category;
  final bool isCleared;

  AddTransaction(
    this.account,
    this.date, 
    this.description, 
    this.amount,
    this.category,
    this.isCleared,
  );

  @override
  Widget build(BuildContext context) {
    CollectionReference transactions = FirebaseFirestore.instance.collection('transactions');

    Future<void> addTransaction() {
      return transactions.add({
        'account': account,
        'date': date,
        'description': description,
        'amount': amount,
        'category': category,
        'isCleared': isCleared,
      })
      .then((value) => print('Transaction Added'))
      .catchError((error) => print('Failed to add transaction: $error'));
    }

    return FlatButton(
      onPressed: addTransaction,
      child: Text('Add Transaction'),
    );
  }
}