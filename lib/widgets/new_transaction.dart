import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTxn;
  NewTransaction(this.addTxn, {super.key});

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount.isNegative) {
      return;
    }

    addTxn(enteredTitle, enteredAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        TextField(
          decoration: const InputDecoration(labelText: 'Title'),
          controller: titleController,
          keyboardType: TextInputType.text,
          onSubmitted: (_) => submitData(),
        ),
        TextField(
          decoration: const InputDecoration(labelText: 'Amount'),
          controller: amountController,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          onSubmitted: (_) => submitData(),
        ),
        TextButton(
          onPressed: submitData,
          child: const Text('Add Transaction'),
        )
      ]),
    );
  }
}
