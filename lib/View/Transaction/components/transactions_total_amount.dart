import 'package:budget/Controller/transaction_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionsTotalAmount extends StatelessWidget {
  const TransactionsTotalAmount({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GetX<TransactionController>(builder: (controller) {
        String amountDollarString =
            '\$${controller.totalAmount.abs().toStringAsFixed(2)}';
        Color amountColor =
            controller.totalAmount < 0 ? Colors.red : Colors.green;

        return Text(
          'Total Balance: $amountDollarString',
          style: TextStyle(color: amountColor),
        );
      }),
    );
  }
}
