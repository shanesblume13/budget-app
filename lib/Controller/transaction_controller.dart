import 'package:budget/Model/account.dart';
import 'package:budget/Model/category.dart';
import 'package:budget/Model/transaction.dart';
import 'package:budget/Repository/account_repository.dart';
import 'package:budget/Repository/category_repository.dart';
import 'package:budget/Repository/transaction_repository.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController {
  final TransactionRepository _transactionRepo = TransactionRepository();
  final CategoryRepository _categoryRepo = CategoryRepository();
  final AccountRepository _accountRepo = AccountRepository();

  var transactionList = List<Transaction>().obs;
  var categoryList = List<Category>().obs;
  var accountList = List<Account>().obs;

  double get totalAmount =>
      transactionList.fold(0, (sum, item) => sum + item.amount);

  @override
  void onInit() {
    super.onInit();
    fetchTransactionList();
  }

  void fetchTransactionList() async {
    await fetchCategoryList();
    await fetchAccountList();

    List<Transaction> transactionListResult =
        await _transactionRepo.getTransactionList();

    for (Transaction transaction in transactionListResult) {
      if (categoryList.length > 0) {
        transaction.category = categoryList.first;
      }

      if (accountList.length > 0) {
        transaction.account = accountList.first;
      }
    }

    transactionList.assignAll(transactionListResult);
  }

  Future<void> fetchCategoryList() async {
    List<Category> categoryListResult = await _categoryRepo.getCategoryList();
    categoryList.assignAll(categoryListResult);
  }

  Future<void> fetchAccountList() async {
    List<Account> accountListResult = await _accountRepo.getAccountList();
    accountList.assignAll(accountListResult);
  }
}
