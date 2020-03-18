import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function fx;
  NewTransaction(this.fx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {

  void _submitData() {

    final eTitle = _titleController.text;
    final eAmount = double.parse(_amountController.text);

    if (eTitle.isEmpty || eAmount <= 0||_selectedDate==null) {
      return;
    }
    widget.fx(eTitle, eAmount,_selectedDate);
    Navigator.of(context).pop();
  }

//Controllers
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return null;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Create new transaction",
              style: TextStyle(fontFamily: 'OpenSans', fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              // onChanged: (val) {
              //   titleInput = val;
              // },
              controller: _titleController,
              decoration: InputDecoration(labelText: "Enter Title"),
              autofocus: true,
            ),
            TextField(
              // onChanged: (val) {
              //   amountInput = double.parse(val);
              // },
              keyboardType: TextInputType.number,
              controller: _amountController,
              decoration: InputDecoration(labelText: "Enter Amount"),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text((_selectedDate == null)
                    ? 'No Date Chosen'
                    : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}'),
                FlatButton(
                    onPressed: _presentDatePicker,
                    child: Text('Choose Date',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).primaryColor)))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
                padding: EdgeInsets.all(15),
                color: Theme.of(context).primaryColorDark,
                onPressed: _submitData,
                child: Text(
                  "Add to transactions",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ))
          ],
        ),
      ),
    );
  }
}
