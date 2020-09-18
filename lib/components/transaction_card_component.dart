import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';

import '../models/transaction_model.dart';

class TransactionCardComponent extends StatelessWidget {
  final Transaction transaction;
  final Function action;

  const TransactionCardComponent({
    Key key,
    this.transaction,
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title;
    IconData icon;

    if (transaction.type == TransactionType.Expenses) {
      title = 'Sent';
      icon = Feather.arrow_up;
    } else if (transaction.type == TransactionType.Income) {
      title = 'Receive';
      icon = Feather.arrow_down;
    } else if (transaction.type == TransactionType.Loan) {
      title = 'Loan';
      icon = MaterialCommunityIcons.cash_usd;
    }

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        onTap: action,
        leading: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            size: 20,
            color: Colors.grey[850],
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.grey[850],
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          transaction.description,
          style: TextStyle(
            color: Colors.grey[400],
            fontSize: 12,
          ),
        ),
        trailing: Text(
          NumberFormat.currency(
            decimalDigits: 2,
            symbol: '\$',
          ).format(transaction.value),
          style: TextStyle(
            color: Colors.grey[850],
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
