import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sentrax_test/services/models.dart';

class TransactionContainer extends StatelessWidget {
  final Transaction transaction;
  final EdgeInsets? margin;
  final void Function(Transaction transaction)? onTap;
  const TransactionContainer(
      {super.key, required this.transaction, this.margin, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: InkWell(
        onTap: () {
          if (onTap != null) {
            onTap!(transaction);
          }
        },
        child: Ink(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 0),
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10)
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    transaction.type!.toUpperCase(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    transaction.amount!,
                    style: const TextStyle(
                        color: Colors.green,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    transaction.currencyCode!,
                    style: const TextStyle(
                      color: Colors.orange,
                    ),
                  ),
                  Text(
                    DateFormat("dd-MM-yyyy")
                        .format(DateTime.parse(transaction.date!)),
                    style: TextStyle(color: Colors.grey.shade500),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
