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
    TransactionController _transactionController = Get.find();

    return Obx(() => ListView.builder(
          itemCount: _transactionController.transactionList.length,
          itemBuilder: (context, index) {
            Transaction transaction = _transactionController.transactionList[index];

            return TransactionsListTile(transaction: transaction);
          },
        ));
  }
}
