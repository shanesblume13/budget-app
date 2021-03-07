import 'package:budget/Controller/account_controller.dart';
import 'package:budget/Controller/category_controller.dart';
import 'package:budget/Model/account.dart';
import 'package:budget/Model/category.dart';
import 'package:budget/Model/transaction.dart';
import 'package:budget/Repository/transaction_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as cf;
import 'package:get/get.dart';

class TransactionController extends GetxController {
  final TransactionRepository _transactionRepo = TransactionRepository();
  final CategoryController _categoryController = Get.put(CategoryController());
  final AccountController _accountController = Get.put(AccountController());
  
  var transactionList = List<Transaction>().obs;
  double get totalAmount => transactionList.fold(0, (sum, item) => sum+ item.amount);

  @override
  void onInit() {
    super.onInit();
    _accountController.fetchAccountList();
    _categoryController.fetchCategoryList();
    fetchTransactionList();
  }

  void fetchTransactionList() async {
    List<Transaction> transactionListResult = await _transactionRepo.getTransactionList();

    transactionList.assignAll(transactionListResult);
  }

  Category fetchCategoryFromDocRef(cf.DocumentReference categoryDocRef) {
    return _categoryController.fetchCategoryFromDocRef(categoryDocRef);
  }

  Account fetchAccountFromDocRef(cf.DocumentReference accountDocRef) {
    return _accountController.fetchAccountFromDocRef(accountDocRef);
  }
}