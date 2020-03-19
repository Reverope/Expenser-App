import 'package:expapp/widgets/chart.dart';
import 'package:expapp/widgets/new_transaction.dart';
import 'package:expapp/widgets/transaction_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'models/transaction.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
    title: 'Expenser',
    theme: ThemeData(
      fontFamily: 'QuickSand',
    ),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 4,
      navigateAfterSeconds: new MyHomePage(),
      title: new Text(
        'expenser',
        style: new TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40.0,
            fontFamily: "QuickSand",
            color: Colors.black87),
      ),
      backgroundColor: Colors.white,
      loadingText: Text(
        "developed by",
        style: TextStyle(fontFamily: "QuickSand", color: Colors.black38),
      ),
      subtitle: Text(
        "Shashwat Priyadarshy",
        style: TextStyle(fontFamily: "QuickSand", color: Colors.black38),
      ),
      photoSize: 100.0,
    );
  }
}

class MyHomePage extends StatefulWidget {
  // String titleInput;
  // double amountInput;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: 't1', title: 'Tap to delete', amount: 0, date: DateTime.now()),
  ];

  List<Transaction> get _recentransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addNew(String title, double amount, DateTime chosenDate) {
    final newTx = Transaction(
        title: title,
        amount: amount,
        date: chosenDate,
        id: UniqueKey().toString());
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void startAddNewTransaction(BuildContext ctx) {
    showCupertinoModalPopup(
        context: ctx,
        builder: (bctx) {
          return NewTransaction(_addNew);
        });
  }

  void _deleteTransaction(String id) {
    setState(() {
      print(id);
      _userTransactions.removeWhere((tx) {
        return tx.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                startAddNewTransaction(context);
              })
        ],
        title: Text(
          "Expenser",
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          startAddNewTransaction(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          SizedBox(
            height: 5,
          ),
          Chart(_recentransactions),
          SizedBox(
            height: 30,
          ),
          TransactionList(_userTransactions, _deleteTransaction)
        ],
      )),
    );
  }
}
