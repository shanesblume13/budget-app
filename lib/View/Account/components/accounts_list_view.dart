import 'package:budget/Controller/account_controller.dart';
import 'package:budget/Model/account.dart';
import 'package:budget/View/Account/components/accounts_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountsListView extends StatelessWidget {
  const AccountsListView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<AccountController>(
      builder: (controller) {
        return ListView.builder(
          itemCount: controller.accountList.length,
          itemBuilder: (context, index) {
            Account account = controller.accountList[index];

            return AccountsListTile(account: account);
          },
        );
      },
    );
  }
}
