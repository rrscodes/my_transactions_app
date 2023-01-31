import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_transactions_app/models/transactions.dart';

class TransactionList extends StatelessWidget {
  final List<Transactions> txn;
  const TransactionList(this.txn, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: ListView.builder(
        itemBuilder: ((context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 20,
            ),
            child: Row(children: [
              Container(
                  width: 70,
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  margin: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Colors.blueGrey,
                    shape: BoxShape.rectangle,
                  ),
                  child: Center(
                    child: Text(
                      '\$${txn[index].amount}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    txn[index].name,
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    DateFormat.yMd().add_jm().format(txn[index].date),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.blueGrey,
                    ),
                  ),
                ],
              )
            ]),
          );
        }),
        itemCount: txn.length,
      ),
    );
  }
}
