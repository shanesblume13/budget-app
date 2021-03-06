import 'package:budget/Model/transaction.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as cf;

class TransactionRepository {
  cf.CollectionReference transactionsCollectionReference = cf.FirebaseFirestore.instance.collection('transactions');

  Future<List<Transaction>> getTransactionList() async {
    
    cf.QuerySnapshot snapshot = await transactionsCollectionReference.get();
    List<Transaction> transactionList = snapshot.docs.map((doc) => Transaction.from(doc)).toList();

    return transactionList;
  }
}