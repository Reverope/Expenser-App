import 'package:expapp/models/transaction.dart';
import 'package:expapp/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import 'new_transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction(id: 't1', title: 'Shoes', amount: 90, date: DateTime.now()),
    Transaction(id: 't2', title: 'NoteBook', amount: 50, date: DateTime.now()),
    Transaction(id: 't1', title: 'Vegies', amount: 70, date: DateTime.now()),
  ];

  void _addNew(String title, double amount) {
    final newTx = Transaction(
        title: title,
        amount: amount,
        date: DateTime.now(),
        id: DateTime.now().toString());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          color: Colors.black12,
          width: double.infinity,
          child: Card(
            child: Text("Chart"),
            elevation: 10,
          ),
        ),
        NewTransaction(_addNew),
        TransactionList(_userTransactions),
      ],
    );
  }
}
