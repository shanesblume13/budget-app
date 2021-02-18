import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class GetTrasnsactionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference transactions =
        FirebaseFirestore.instance.collection('transactions');

    return StreamBuilder<QuerySnapshot>(
        stream: transactions.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          double containerHeight = MediaQuery.of(context).size.height * 0.75;
          double trailingWidth = MediaQuery.of(context).size.width * 0.25;
          Widget content = Text('Loading...');

          if (snapshot.hasError) {
            content = Text('Something went wrong.');
          }

          if (snapshot.connectionState != ConnectionState.waiting) {
            content = ListView(
              children: snapshot.data.docs.map((DocumentSnapshot document) {
                return new ListTile(
                  leading: Text(document.data()['category']),
                  title: new Text(document.data()['description']),
                  subtitle: new Text(document.data()['account'] +
                      ' on ' +
                      formatDate(document.data()['date'].toDate(),
                          [M, ' ', dd, ', ', yyyy])),
                  trailing: Container(
                      width: trailingWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('\$' +
                              document.data()['amount'].toStringAsFixed(2)),
                        ],
                      )),
                  dense: true,
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
