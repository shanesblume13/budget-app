import 'package:budget/Controller/account_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountsTotalBalance extends StatelessWidget {
  const AccountsTotalBalance({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GetX<AccountController>(builder: (controller) {
        String balanceDollarString =
            '\$${controller.totalBalance.abs().toStringAsFixed(2)}';
        Color balanceColor =
            controller.totalBalance < 0 ? Colors.red : Colors.green;

        return Text(
          'Total Balance: $balanceDollarString',
          style: TextStyle(color: balanceColor),
        );
      }),
    );
  }
}
