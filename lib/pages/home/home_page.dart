import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:teste_tonolucro/components/transaction_card_component.dart';
import 'package:teste_tonolucro/pages/home/components/bottom_navigation_bar_component.dart';
import 'package:teste_tonolucro/pages/home/components/profile_card_component.dart';

import '../../models/transaction_model.dart';
import '../../stores/transactions/transactions_store.dart';
import '../transactions/transactions_page.dart';

class HomePage extends StatefulWidget {
  static final String routeName = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final transactionsStore = Provider.of<TransactionsStore>(context);
    transactionsStore.loadTransactions();

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Observer(builder: (_) {
                return ProfileCardComponent(
                  income: transactionsStore.incomes,
                  expenses: transactionsStore.expenses,
                  loan: transactionsStore.loan,
                );
              }),
              Container(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Overview',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: Badge(
                            badgeColor: Colors.red[500],
                            child: Icon(
                              Feather.bell,
                              color: Colors.grey[850],
                              size: 20,
                            ),
                          ),
                          onPressed: () {},
                        )
                      ],
                    ),
                    Text(
                      'Sept 13, 2020',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Observer(builder: (_) {
                return !transactionsStore.loading
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: transactionsStore.transactions.length,
                        itemBuilder: (context, index) {
                          Transaction transaction =
                              transactionsStore.transactions[index];
                          return TransactionCardComponent(
                            transaction: transaction,
                            action: () {
                              Navigator.pushNamed(
                                context,
                                TransactionsPage.routeName,
                              );
                            },
                          );
                        },
                      )
                    : CircularProgressIndicator(
                        backgroundColor: Theme.of(context).primaryColor,
                      );
              }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarComponent(),
    );
  }
}
