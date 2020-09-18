import 'package:teste_tonolucro/interfaces/transactions_repository_interface.dart';
import 'package:teste_tonolucro/models/transaction_model.dart';

import '../models/transaction_model.dart';

class TransactionsRepository implements ITransactionsRepository {
  @override
  Future<List<Transaction>> getAll() async {
    await Future.delayed(Duration(milliseconds: 1500));
    return [
      Transaction(
        'Sending transfer to Carol',
        750,
        TransactionType.Expenses,
      ),
      Transaction(
        'Sending refund to Adam',
        500,
        TransactionType.Expenses,
      ),
      Transaction(
        'Sending payment of rent',
        600,
        TransactionType.Expenses,
      ),
      Transaction(
        'Loan for the Car',
        850,
        TransactionType.Loan,
      ),
      Transaction(
        'Receiving Freela',
        1500,
        TransactionType.Income,
      ),
      Transaction(
        'Receiving investments',
        1000,
        TransactionType.Income,
      ),
      Transaction(
        'Receiving salary',
        4000,
        TransactionType.Income,
      ),
    ];
  }
}
