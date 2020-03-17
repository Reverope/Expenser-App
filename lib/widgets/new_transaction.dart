import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  void submitData() {
    final eTitle = titleController.text;
    final eAmount = double.parse(amountController.text);
    if (eTitle.isEmpty || eAmount <= 0) {
      return;
    }
    fx(eTitle, eAmount);
  }

  final Function fx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  NewTransaction(this.fx);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              // onChanged: (val) {
              //   titleInput = val;
              // },
              controller: titleController,
              decoration: InputDecoration(labelText: "Enter Title"),
            ),
            TextField(
              // onChanged: (val) {
              //   amountInput = double.parse(val);
              // },
              keyboardType: TextInputType.number,
              controller: amountController,
              decoration: InputDecoration(labelText: "Enter Amount"),
            ),
            FlatButton(
                color: Colors.black38,
                onPressed: submitData,
                child: Text(
                  "Add to transactions",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
