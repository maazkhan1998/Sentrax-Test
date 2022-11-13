import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sentrax_test/screens/transaction_detail_screen.dart';
import 'package:sentrax_test/services/customExceptionHandling.dart';
import 'package:sentrax_test/services/db.dart';
import 'package:sentrax_test/services/helper_functions.dart';
import 'package:sentrax_test/services/models.dart';
import 'package:sentrax_test/services/transaction_container.dart';
import 'package:sentrax_test/shared/customTextFormField.dart';
import 'package:sentrax_test/shared/custom_loading.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Transaction> _allTransactions = [];
  final loading = ValueNotifier(false);
  final _searchController = TextEditingController();
  final StreamController<String> _stream = StreamController<String>();

  @override
  void initState() {
    super.initState();
    getTransaction();
  }

  Future<void> getTransaction() async {
    try {
      loading.value = true;

      final response = await DB().getAllTransactions();

      setState(() => _allTransactions = List.from(response));
    } catch (e) {
      HelperFunction.shared
          .showToast(CustomExceptionHandling().handleException(e));
    } finally {
      loading.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("All Transactions"),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            RefreshIndicator(
              onRefresh: getTransaction,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: _searchController,
                      hintText: "Search Transaction by amount",
                      textInputType: TextInputType.number,
                      onChange: (val) => _stream.add(val),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    StreamBuilder<String>(
                        stream: _stream.stream,
                        initialData: "",
                        builder: (context, snapshot) {
                          List<Transaction> tempTransaction = [];
                          if (snapshot.data!.trim().isEmpty) {
                            tempTransaction = List.from(_allTransactions);
                          } else {
                            tempTransaction = _allTransactions
                                .where((element) =>
                                    element.amount!.startsWith(snapshot.data!))
                                .toList();
                          }

                          return ListView.separated(
                            itemCount: tempTransaction.length,
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            separatorBuilder: (ctx, i) => const SizedBox(
                              height: 10,
                            ),
                            itemBuilder: (ctx, index) => TransactionContainer(
                                onTap: (transaction) => Navigator.of(context)
                                    .push(MaterialPageRoute(
                                        builder: (ctx) =>
                                            TransactionDetailScreen(
                                                transaction: transaction))),
                                transaction: tempTransaction[index]),
                          );
                        }),
                  ],
                ),
              ),
            ),
            ValueListenableBuilder(
                valueListenable: loading,
                builder: (ctx, val, _) => loading.value
                    ? const CustomLoading(
                        loadingtext: "Loading Transactions",
                      )
                    : Container())
          ],
        ),
      ),
    );
  }
}
