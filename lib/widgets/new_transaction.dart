import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTxn;
  NewTransaction(this.addTxn, {super.key});

  final titleController = TextEditingController();
  final amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 20,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
            decoration: const InputDecoration(labelText: 'Title'),
            controller: titleController,
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Amount'),
            controller: amountController,
          ),
          TextButton(
            onPressed: () => {
              addTxn(titleController.text, double.parse(amountController.text))
            },
            child: const Text('Add Transaction'),
          )
        ]),
      ),
    );
  }
}
