import 'package:budget/Transaction/add_transaction.dart';
import 'package:budget/Transaction/transaction_list_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatefulWidget {
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  bool _initialized = false;
  bool _error = false;

  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_error) {
      return somethingWentWrong();
    }

    if (!_initialized) {
      return loading();
    }

    return budgetApp();
  }

  Widget somethingWentWrong() {
    return Container(
      child: Center(
        child: Text(
          'Somthing went wrong!',
          textDirection: TextDirection.ltr,
        ),
      ),
    );
  }

  Widget loading() {
    return Container(
      child: Center(
        child: Text(
          'Loading...',
          textDirection: TextDirection.ltr,
        ),
      ),
    );
  }

  Widget budgetApp() {
    return MaterialApp(
      title: 'Blume Budgeting',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Transactions'),
        ),
        body: Column(
          children: [
            TrasnsactionListView(),
            AddTransaction(
              'LMCU',
              DateTime.now(),
              'Amazon',
              5.49,
              'Family',
              false,
            ),
          ],
        ),
      ),
    );
  }
}


