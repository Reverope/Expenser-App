import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;
  final AppBar appBar;

  ChartBar(
      this.label, this.spendingAmount, this.spendingPctOfTotal, this.appBar);

  @override
  Widget build(BuildContext context) {
    Orientation ori = MediaQuery.of(context).orientation;
    Orientation p = Orientation.portrait;

    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Padding(
          padding: EdgeInsets.all((ori == p) ? 0.2 : 0.05),
          child: Column(
            children: <Widget>[
              FittedBox(child: Text('\₹${spendingAmount.toStringAsFixed(0)}')),
              SizedBox(height: 10),
              // Container(
              //   height: (MediaQuery.of(context).size.height -
              //           appBar.preferredSize.height -
              //           MediaQuery.of(context).padding.top -
              //           10) *
              //       .1,
              //   width: 10,
              // ),

              CircularPercentIndicator(
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Colors.redAccent[300],
                center: Text(label),
                animation: true,
                radius: MediaQuery.of(context).size.width *
                    ((ori == p) ? 0.12 : 0.05),
                percent: spendingPctOfTotal,
              ),
            ],
          ),
        );
      },
    );
  }
}

// Container(
//               height: (MediaQuery.of(context).size.height -
//                       appBar.preferredSize.height -
//                       MediaQuery.of(context).padding.top -
//                       10) *
//                   .1,
//               width: 10,
//               child: Stack(
//                 children: <Widget>[
//                   Container(
//                     decoration: BoxDecoration(
//                         border: Border.all(width: .1, color: Colors.black12),
//                         color: Color.fromRGBO(220, 220, 220, 1),
//                         borderRadius: BorderRadius.circular(10)),
//                   ),

// FractionallySizedBox(
//   heightFactor: spendingPctOfTotal,
//   child: Container(
//     decoration: BoxDecoration(
//       color: Theme.of(context).primaryColor,
//       borderRadius: BorderRadius.circular(10),
//     ),
//   ),
// )
//                 ],
//               ),
//             ),
