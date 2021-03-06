import 'package:budget/Controller/transaction_controller.dart';
import 'package:budget/Model/transaction.dart';
import 'package:budget/View/Transaction/components/transactions_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionsListView extends StatelessWidget {
  const TransactionsListView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<TransactionController>(
      builder: (controller) {
        return ListView.builder(
          itemCount: controller.transactionList.length,
          itemBuilder: (context, index) {
            Transaction transaction = controller.transactionList[index];

            return TransactionsListTile(transaction: transaction);
          },
        );
      },
    );
  }
}
