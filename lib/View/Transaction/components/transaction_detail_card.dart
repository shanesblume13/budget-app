import 'package:budget/Model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionDetailCard extends StatelessWidget {
  const TransactionDetailCard({
    Key key,
    this.transaction,
  }) : super(key: key);

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    String amountDollarString =
        '\$${transaction.amount.abs().toStringAsFixed(2)}';
    Color amountColor = transaction.amount < 0 ? Colors.red : Colors.green;

    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction.description,
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      DateFormat.yMMMd().format(transaction.clearedDate),
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      transaction.category?.name ?? 'Unknown',
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      transaction.account?.name ?? 'Unknown',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      amountDollarString,
                      style: TextStyle(color: amountColor, fontSize: 24),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
