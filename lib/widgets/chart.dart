import 'package:Expenser/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;
  final appBar;
  Chart(this.recentTransaction, this.appBar);

  List<Map<String, Object>> get grouperTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      double totalSum = 0;
      for (var i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == weekDay.day &&
            recentTransaction[i].date.month == weekDay.month) {
          totalSum += recentTransaction[i].amount;
        }
      }
      print(DateFormat.E().format(weekDay));

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 2),
        'amount': totalSum
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return grouperTransactionValues.fold(0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Column(
        children: <Widget>[
        
          (MediaQuery.of(context).orientation == Orientation.portrait)
              ? Row(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.all(10),
                        child: Text("Transaction of Last 7 Days")),
                  ],
                )
              : SizedBox(height: 0),
          Card(
            child: Container(
              padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: grouperTransactionValues.map((data) {
                  return Container(                  
                    child: Flexible(
                      fit: FlexFit.tight,
                      child: ChartBar(
                          data['day'],
                          data['amount'],
                          totalSpending == 0
                              ? (0)
                              : (data['amount'] as double) / totalSpending,
                          appBar),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
