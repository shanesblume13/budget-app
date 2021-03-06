import 'package:budget/Model/account.dart';
import 'package:budget/View/Account/components/account_detail_card.dart';
import 'package:budget/View/Account/components/accounts_total_balance.dart';
import 'package:flutter/material.dart';

class AccountDetailPage extends StatelessWidget {
  
  const AccountDetailPage({
    Key key,
    this.account,
  }) : super(key: key);

  final Account account;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: AccountDetailCard(account: account),
            ),
            AccountsTotalBalance(),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}


