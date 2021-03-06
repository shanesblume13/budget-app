import 'package:budget/Model/transaction.dart';
import 'package:budget/Repository/transaction_repository.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController {
  TransactionRepository _transactionRepo = TransactionRepository();
  
  var transactionList = List<Transaction>().obs;
  double get totalAmount => transactionList.fold(0, (sum, item) => sum+ item.amount);

  @override
  void onInit() {
    super.onInit();
    fetchTransactionList();
  }

  void fetchTransactionList() async {
    var transactionListResult = await _transactionRepo.getTransactionList();

    transactionList.assignAll(transactionListResult);
  }
}