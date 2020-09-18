import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:teste_tonolucro/components/transaction_card_component.dart';

import '../../models/transaction_model.dart';
import '../../stores/transactions/transactions_store.dart';

class TransactionsPage extends StatefulWidget {
  static final String routeName = '/transactions';

  @override
  _TransactionsPageState createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  int _choiceChipIndex = 0;

  @override
  Widget build(BuildContext context) {
    final transactionsStore = Provider.of<TransactionsStore>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Theme.of(context).backgroundColor,
                elevation: 0,
                leading: IconButton(
                  icon: Icon(
                    Ionicons.ios_arrow_back,
                    size: 22,
                    color: Colors.grey[800],
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                actions: [
                  IconButton(
                    icon: Icon(
                      Feather.search,
                      size: 22,
                      color: Colors.grey[800],
                    ),
                    onPressed: () {},
                  )
                ],
                pinned: false,
                floating: true,
                snap: true,
                forceElevated: innerBoxIsScrolled,
              ),
            ];
          },
          body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recent Transactions',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    FlatButton(
                      child: Text(
                        'See all',
                        style: TextStyle(color: Colors.grey[850]),
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
                Row(
                  children: [
                    ChoiceChip(
                      elevation: 4,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      label: Text('All'),
                      labelStyle: TextStyle(
                        color: _choiceChipIndex == 0
                            ? Colors.white
                            : Colors.grey[850],
                      ),
                      backgroundColor: Colors.white,
                      selectedColor: Theme.of(context).primaryColor,
                      selected: _choiceChipIndex == 0,
                      onSelected: (bool selected) {
                        setState(() {
                          _choiceChipIndex = 0;
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ChoiceChip(
                        elevation: 4,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        label: Text('Income'),
                        labelStyle: TextStyle(
                          color: _choiceChipIndex == 1
                              ? Colors.white
                              : Colors.grey[850],
                        ),
                        backgroundColor: Colors.white,
                        selectedColor: Theme.of(context).primaryColor,
                        selected: _choiceChipIndex == 1,
                        onSelected: (bool selected) {
                          setState(() {
                            _choiceChipIndex = 1;
                          });
                        },
                      ),
                    ),
                    ChoiceChip(
                      elevation: 4,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      label: Text('Expense'),
                      labelStyle: TextStyle(
                        color: _choiceChipIndex == 2
                            ? Colors.white
                            : Colors.grey[850],
                      ),
                      backgroundColor: Colors.white,
                      selectedColor: Theme.of(context).primaryColor,
                      selected: _choiceChipIndex == 2,
                      onSelected: (bool selected) {
                        setState(() {
                          _choiceChipIndex = 2;
                        });
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Today',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
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
                              action: () {},
                            );
                          },
                        )
                      : Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Theme.of(context).primaryColor,
                          ),
                        );
                }),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Image.asset(
                    'lib/assets/contacts.png',
                    width: double.maxFinite,
                  ),
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: 50,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    color: Theme.of(context).primaryColor,
                    child: Text(
                      'See Details',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
