import 'package:budget/View/Transaction/transactions_page.dart';
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
      title: 'Budget App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: Text('Drawer Header'),
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text('Budget App'),
        ),
        body: Center(
          child: TransactionsPage(),
        ),
      ),
    );
  }
}
