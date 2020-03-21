import 'package:Expenser/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function delete;
  TransactionList(this.transactions, this.delete);

  @override

  //list of transation datatype : datas

  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              padding: EdgeInsets.all(10),
              child: (transactions.isEmpty)
                  ? (Text(
                      "You have no transactios ! Press + to add transactions"))
                  : (Text("Your Transactions"))),
          Container(
            
            height: constraints.maxHeight*0.8,
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (ctx, index) {
                return Card(
                  margin: EdgeInsets.all(5),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(10),
                    leading: CircleAvatar(
                      maxRadius: 40,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text("₹ " +
                              transactions[index].amount.toStringAsFixed(0)),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Color.fromRGBO(50, 50, 50, .9)),
                    ),
                    subtitle:
                        Text(DateFormat.yMd().format(transactions[index].date)),
                    trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          delete(transactions[index].id);
                        }),
                  ),
                );
              },
              itemCount: transactions.length,
              addAutomaticKeepAlives: true,
              scrollDirection: Axis.vertical,
              // children: transactions.map((tx) {}).toList(),
            ),
          ),
        ],
      );
    });
  }
}
