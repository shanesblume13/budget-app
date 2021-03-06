import 'package:budget/Model/transaction.dart';
import 'package:budget/View/Transaction/components/transaction_detail_card.dart';
import 'package:budget/View/Transaction/components/transactions_total_amount.dart';
import 'package:flutter/material.dart';

class TransactionDetailPage extends StatelessWidget {
  
  const TransactionDetailPage({
    Key key,
    this.transaction,
  }) : super(key: key);

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: TransactionDetailCard(transaction: transaction),
            ),
            TransactionsTotalAmount(),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}


