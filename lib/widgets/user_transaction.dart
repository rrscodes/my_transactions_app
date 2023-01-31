import 'package:flutter/material.dart';
import 'package:my_transactions_app/models/transactions.dart';
import 'package:my_transactions_app/widgets/new_transaction.dart';
import 'package:my_transactions_app/widgets/transaction_list.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({super.key});

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTx),
        TransactionList(_userTransaction),
      ],
    );
  }
}
