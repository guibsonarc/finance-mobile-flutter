import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';

class ProfileCardComponent extends StatelessWidget {
  final double income;
  final double expenses;
  final double loan;

  const ProfileCardComponent({Key key, this.income, this.expenses, this.loan})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    Feather.menu,
                    color: Colors.grey[850],
                    size: 20,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Feather.more_vertical,
                    color: Colors.grey[850],
                    size: 20,
                  ),
                  onPressed: () {},
                )
              ],
            ),
            Container(
              width: 80,
              height: 80,
              child: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                backgroundImage: AssetImage('lib/assets/avatar.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 5),
              child: Text(
                'Guibson Arcebispo',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: Text(
                'Software Developer',
                style: TextStyle(
                  color: Colors.grey[850],
                  fontSize: 12,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          NumberFormat.currency(
                            decimalDigits: 2,
                            symbol: '\$',
                          ).format(income),
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Text(
                        'Income',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[850],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.symmetric(
                        vertical: BorderSide.none,
                        horizontal: BorderSide(
                          color: Colors.grey[300],
                          width: 1,
                        ),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Text(
                            NumberFormat.currency(
                              decimalDigits: 2,
                              symbol: '\$',
                            ).format(expenses),
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Text(
                          'Expenses',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[850],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          NumberFormat.currency(
                            decimalDigits: 2,
                            symbol: '\$',
                          ).format(loan),
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Text(
                        'Loan',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[850],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
