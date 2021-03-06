import 'package:budget/Model/account.dart';
import 'package:budget/Repository/account_repository.dart';
import 'package:get/get.dart';

class AccountController extends GetxController {
  AccountRepository _accountRepo = AccountRepository();
  
  var accountList = List<Account>().obs;
  double get totalBalance => accountList.fold(0, (sum, item) => sum+ item.balance);

  @override
  void onInit() {
    super.onInit();
    fetchAccountList();
  }

  void fetchAccountList() async {
    var accountListResult = await _accountRepo.getAccountList();

    accountList.assignAll(accountListResult);
  }
}