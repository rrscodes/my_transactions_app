import 'package:flutter/material.dart';
import 'package:my_transactions_app/widgets/user_transaction.dart';

void main() {
  runApp(MyTransactionsApp());
}

class MyTransactionsApp extends StatefulWidget {
  const MyTransactionsApp({super.key});

  @override
  State<MyTransactionsApp> createState() => _MyTransactionsAppState();
}

class _MyTransactionsAppState extends State<MyTransactionsApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My Transactions App'),
        ),
        body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Card(
                  margin: const EdgeInsets.all(20),
                  child: Container(
                    height: 100,
                    width: double.infinity,
                  ),
                ),
                const UserTransaction(),
              ]),
        ),
      ),
    );
  }
}
