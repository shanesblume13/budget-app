import 'package:budget/Model/transaction.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as cf;

class TransactionRepository {
  cf.CollectionReference transactionsCollectionReference =
      cf.FirebaseFirestore.instance.collection('transactions');

  Stream<Iterable<Transaction>> getTransactionList() {
    return transactionsCollectionReference
        .get()
        .then((snapshot) {
      return snapshot.docs.map((doc) => Transaction.fromDocument(doc)).toList();
    }).asStream();
  }

  Future<cf.DocumentReference> addTransaction(Transaction transaction) async {
    var result = await transactionsCollectionReference.add({
      'description': transaction.description,
      'amount': transaction.amount,
      'clearedDate': transaction.clearedDate,
      'accountDocRef': transaction.accountDocRef,
      'categoryDocRef': transaction.categoryDocRef,
    });

    return result;
  }

  Future<void> deleteTransaction(cf.DocumentReference docRef) {
    return transactionsCollectionReference.doc(docRef.id).delete();
  }
}
