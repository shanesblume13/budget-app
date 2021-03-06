import 'package:budget/Model/account.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AccountDetailCard extends StatelessWidget {
  const AccountDetailCard({
    Key key,
    this.account,
  }) : super(key: key);

  final Account account;

  @override
  Widget build(BuildContext context) {
    String balanceDollarString =
        '\$${account.balance.abs().toStringAsFixed(2)}';
    Color balanceColor = account.balance < 0 ? Colors.red : Colors.green;

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
                      account.name,
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      DateFormat.yMMMd().format(account.lastUpdated),
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
    );
  }
}
