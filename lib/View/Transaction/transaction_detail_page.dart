import 'package:budget/Controller/transaction_controller.dart';
import 'package:budget/Model/transaction.dart';
import 'package:budget/View/Transaction/components/transaction_detail_card.dart';
import 'package:budget/View/Transaction/components/transactions_total_amount.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionDetailPage extends StatelessWidget {
  
  TransactionDetailPage({
    Key key,
    @required this.transaction,
  }) : super(key: key);

  final Transaction transaction;
  final TransactionController _transactionController = Get.find();

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
      floatingActionButton: FloatingActionButton(
        onPressed: () => deleteTransaction(),
        child: Icon(Icons.delete),
      ),
    );
  }

  void deleteTransaction() {
    _transactionController.deleteTransaction(transaction.docRef);
    Get.back();
  } 
}
