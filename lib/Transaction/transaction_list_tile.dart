import 'package:budget/Transaction/transaction_detail_form.dart';
import 'package:budget/models/transaction_model.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class TransactionListTile extends StatelessWidget {
  final Transaction transaction;

  TransactionListTile({
    this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      leading: Text(transaction.category),
      title: new Text(transaction.description),
      subtitle: new Text(transaction.account +
          ' on ' +
          formatDate(transaction.date, [M, ' ', dd, ', ', yyyy])),
      trailing: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('\$' + transaction.amount.toStringAsFixed(2)),
            ],
          )),
      dense: true,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) =>
                new TransactionDetailForm(
              transaction: transaction,
              context: context,
            ),
            fullscreenDialog: true,
          ),
        );
      },
    );
  }
}