import 'package:flutter/material.dart';
import 'package:my_transactions_app/models/transactions.dart';
import 'package:my_transactions_app/widgets/new_transaction.dart';
import 'package:my_transactions_app/widgets/transaction_list.dart';

void main() {
  runApp(const MyTransactionsApp());
}

class MyTransactionsApp extends StatefulWidget {
  const MyTransactionsApp({super.key});

  @override
  State<MyTransactionsApp> createState() => _MyTransactionsAppState();
}

class _MyTransactionsAppState extends State<MyTransactionsApp> {
  final List<Transactions> _userTransaction = [
    Transactions(
      id: '1',
      name: 'New Shoe',
      amount: 20.99,
      date: DateTime.now(),
    ),
    Transactions(
      id: '2',
      name: 'New Shirt',
      amount: 3.99,
      date: DateTime.now(),
    )
  ];

  void _addNewTx(String title, double amount) {
    final newTx = Transactions(
      id: DateTime.now().toString(),
      name: title,
      amount: amount,
      date: DateTime.now(),
    );
    setState(() {
      _userTransaction.add(newTx);
    });
  }

  void _startAddNewtxn(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (BuildContext ctx1) {
        return NewTransaction(_addNewTx);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My Transactions App'),
          actions: [
            Builder(
              builder: (context) {
                return IconButton(
                  onPressed: () => _startAddNewtxn(context),
                  icon: const Icon(Icons.add_circle),
                );
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Card(
                margin: EdgeInsets.all(20),
                child: SizedBox(
                  height: 100,
                  width: double.infinity,
                ),
              ),
              TransactionList(_userTransaction),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Builder(
          builder: (context) {
            return FloatingActionButton(
              onPressed: () => _startAddNewtxn(context),
              child: const Icon(Icons.add),
            );
          },
        ),
      ),
    );
  }
}
