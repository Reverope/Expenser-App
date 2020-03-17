import 'package:expapp/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);

  @override

  //list of transation datatype : datas

  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (ctx, index) {
          return Card(
            // margin: EdgeInsets.all(5),
            // child: ListTile(
            //   contentPadding: EdgeInsets.all(10),
            //   leading: Text("₹ "+tx.amount.toString()),
            //   title: Text(tx.title,style: TextStyle(fontSize: 22,fontWeight: FontWeight.w800 ),),
            //   subtitle: Text(tx.date.toIso8601String(),)
            // ),
            child: Container(
              child: Row(
                children: <Widget>[
                  Container(
                    width: 70,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(width: .5),
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Text("₹ " + transactions[index].amount.toStringAsFixed(0)),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        transactions[index].title,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Color.fromRGBO(50, 50, 50, .9)),
                      ),
                      Text(
                        DateFormat().format(transactions[index].date),
                        style: TextStyle(
                            fontSize: 12, color: Colors.grey, letterSpacing: 1),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
        itemCount: transactions.length,
        addAutomaticKeepAlives: true,
        scrollDirection: Axis.vertical,
        // children: transactions.map((tx) {}).toList(),
      ),
    );
  }
}
