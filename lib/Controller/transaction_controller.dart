import 'package:budget/Model/transaction.dart';
import 'package:budget/Repository/transaction_repository.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController {
  final TransactionRepository _transactionRepo = TransactionRepository();
  RxList<Transaction> transactionList = List<Transaction>().obs;

  double get totalAmount =>
      transactionList.fold(0, (sum, item) => sum + item.amount);

  @override
  void onInit() {
    super.onInit();
    
    transactionList.bindStream(fetchTransactionList());
  }

  Stream<Iterable<Transaction>> fetchTransactionList() {
    return _transactionRepo.getTransactionList();
  }

  void addTransaction() async {
    Transaction transaction = Transaction(
      description: 'A new transaction',
      amount: -.99,
      clearedDate: DateTime.now(),
      accountDocRef: null,
      categoryDocRef: null,
    );

    try {
      await _transactionRepo.addTransaction(transaction).then((docRef) {
        transaction.docRef = docRef;
        transactionList.add(transaction);
      });
    } catch (error) {
      print('Error adding transaction: $error');
    }
  }
}
