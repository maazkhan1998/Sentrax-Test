import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sentrax_test/services/models.dart';

class TransactionDetailScreen extends StatelessWidget {
  final Transaction transaction;
  const TransactionDetailScreen({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: transaction.currencyCode!,
                      style:
                          const TextStyle(color: Colors.orange, fontSize: 22)),
                  TextSpan(
                      text: " ${transaction.amount}",
                      style: const TextStyle(
                          color: Colors.green,
                          fontSize: 34,
                          fontWeight: FontWeight.bold))
                ])),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  transaction.type!.toUpperCase(),
                  style: const TextStyle(color: Colors.red, fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                    text: TextSpan(children: [
                  const TextSpan(
                      text: "Date: ",
                      style: TextStyle(color: Colors.black, fontSize: 18)),
                  TextSpan(
                      text: DateFormat("dd-MM-yyyy")
                          .format(DateTime.parse(transaction.date!)),
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 20,
                      ))
                ])),
                const SizedBox(
                  height: 10,
                ),
                const Text("IBAN #:",
                    style: TextStyle(color: Colors.black, fontSize: 18)),
                const SizedBox(
                  height: 10,
                ),
                Text(transaction.iban!,
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 20,
                    )),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                    text: TextSpan(children: [
                  const TextSpan(
                      text: "BIC #: ",
                      style: TextStyle(color: Colors.black, fontSize: 18)),
                  TextSpan(
                      text: transaction.bic!,
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 20,
                      ))
                ])),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  transaction.description!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
