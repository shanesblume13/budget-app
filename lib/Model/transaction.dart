import 'package:budget/Controller/transaction_controller.dart';
import 'package:budget/Model/account.dart';
import 'package:budget/Model/category.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Transaction {
  final DocumentReference docRef;
  final String description;
  final double amount;
  final DateTime clearedDate;
  final DocumentReference accountDocRef;
  final Account account;
  final DocumentReference categoryDocRef;
  final Category category;

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

  final TransactionController _transactionController = TransactionController();

  factory Transaction.from(DocumentSnapshot document) => Transaction(
        docRef: document.reference,
        description: document.data()['description'],
        amount: document.data()['amount'].toDouble(),
        clearedDate: document.data()['clearedDate'].toDate(),
        accountDocRef: document.data()['accountDocRef'],
        account: TransactionController().fetchAccountFromDocRef(document.data()['accountDocRef']),
        categoryDocRef: document.data()['categoryDocRef'],
        category: TransactionController().fetchCategoryFromDocRef(document.data()['categoryDocRef']),
      );
}
