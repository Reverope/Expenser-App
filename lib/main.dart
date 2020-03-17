import 'package:expapp/widgets/user_transaction.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expenser',
      home: MyHomePage(),

      // darkTheme: ThemeData.dark(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // String titleInput;
  // double amountInput;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(243, 243, 243, 1),
        title: Text(
          "Expenser",
          style: TextStyle(color: Color.fromRGBO(50, 50, 50, .9)),
        ),
      ),
      body: SingleChildScrollView(child: UserTransaction()),
    );
  }
}
