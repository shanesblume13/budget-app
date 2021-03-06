import 'package:budget/Model/account.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as cf;

class AccountRepository {
  cf.CollectionReference accountsCollectionReference = cf.FirebaseFirestore.instance.collection('accounts');

  Future<List<Account>> getAccountList() async {
    
    cf.QuerySnapshot snapshot = await accountsCollectionReference.get();
    List<Account> accountList = snapshot.docs.map((doc) => Account.from(doc)).toList();

    return accountList;
  }
}