import 'package:budget/Model/transaction.dart';
import 'package:budget/View/Transaction/transaction_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionsListTile extends StatelessWidget {
  const TransactionsListTile({
    Key key,
    @required this.transaction,
  }) : super(key: key);

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    String balanceDollarString =
        '\$${transaction.amount.abs().toStringAsFixed(2)}';
    Color balanceColor = transaction.amount < 0 ? Colors.red : Colors.green;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TransactionDetailPage(transaction: transaction),
          ),
        );
      },
      child: Card(
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
                        transaction.category?.name ?? 'No Category',
                        style: TextStyle(fontSize: 16),
                      ),                      
                      Text(
                        transaction.account?.name ?? 'No Account',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        DateFormat.yMMMd().format(transaction.clearedDate),
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        balanceDollarString,
                        style: TextStyle(color: balanceColor, fontSize: 24),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
