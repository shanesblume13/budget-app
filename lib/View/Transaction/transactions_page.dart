import 'package:budget/Controller/transaction_controller.dart';
import 'package:budget/View/Transaction/components/transactions_list_view.dart';
import 'package:budget/View/Transaction/components/transactions_total_amount.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionsPage extends StatelessWidget {
  final TransactionController transactionController =
      Get.put(TransactionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: TransactionsListView(),
            ),
            TransactionsTotalAmount(),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
