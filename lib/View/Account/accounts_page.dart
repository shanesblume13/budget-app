import 'package:budget/Controller/account_controller.dart';
import 'package:budget/View/Account/components/accounts_list_view.dart';
import 'package:budget/View/Account/components/accounts_total_balance.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountsPage extends StatelessWidget {
  final accountController = Get.put(AccountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: AccountsListView(),
            ),
            AccountsTotalBalance(),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}


