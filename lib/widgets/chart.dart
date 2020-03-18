import 'package:expapp/models/transaction.dart';
import 'package:expapp/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;
  Chart(this.recentTransaction);

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
    
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(10),
                child: Text("Transaction of Last 7 Days")),
          ],
        ),
        Card(
          elevation: 10,
          margin: EdgeInsets.all(5),
          child: Container(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: grouperTransactionValues.map((data) {
                return Flexible(
                  fit: FlexFit.tight,
                  child: ChartBar(
                    data['day'],
                    data['amount'],
                    totalSpending == 0
                        ? (0)
                        : (data['amount'] as double) / totalSpending,
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
