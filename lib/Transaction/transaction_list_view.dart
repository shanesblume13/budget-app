import 'package:budget/Transaction/transaction_list_tile.dart';
import 'package:budget/models/transaction_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as cfs;
import 'package:flutter/material.dart';

class TrasnsactionListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<cfs.QuerySnapshot>(
        stream: cfs.FirebaseFirestore.instance
            .collection('transactions')
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<cfs.QuerySnapshot> snapshot) {
          double containerHeight = MediaQuery.of(context).size.height * 0.75;

          Widget content = Text('Loading...');

          if (snapshot.hasError) {
            content = Text('Something went wrong.');
          }

          if (snapshot.connectionState != ConnectionState.waiting) {
            final List<cfs.DocumentSnapshot> documents = snapshot.data.docs;
            final List<Transaction> transactionList = documents
                .map((snapshot) => Transaction.from(snapshot))
                .toList();

            content = ListView(
              //children: snapshot.data.docs.map((cfs.DocumentSnapshot document) {
              children: transactionList.map((Transaction transaction) {
                return Card(
                  child: TransactionListTile(transaction: transaction),
                );
              }).toList(),
            );
          }

          return Container(
            height: containerHeight,
            child: Column(
              children: [
                Expanded(
                  child: content,
                ),
              ],
            ),
          );
        });
  }
}


