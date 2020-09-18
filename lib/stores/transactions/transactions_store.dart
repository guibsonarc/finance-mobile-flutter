import 'package:mobx/mobx.dart';
import 'package:teste_tonolucro/interfaces/transactions_service_interface.dart';
import 'package:teste_tonolucro/models/transaction_model.dart';

import '../../models/transaction_model.dart';
part 'transactions_store.g.dart';

class TransactionsStore = _TransactionsStoreBase with _$TransactionsStore;

abstract class _TransactionsStoreBase with Store {
  final ITransactionsService _service;

  @observable
  List<Transaction> transactions;
  @observable
  double incomes;
  @observable
  double loan;
  @observable
  double expenses;
  @observable
  bool loading;

  _TransactionsStoreBase(this._service) {
    loading = false;
    incomes = 0;
    loan = 0;
    expenses = 0;
    transactions = [];
  }

  @action
  loadTransactions() async {
    loading = true;

    transactions = await _service.getTransactions();

    transactions.forEach((e) {
      if (e.type == TransactionType.Expenses) {
        expenses += e.value;
      } else if (e.type == TransactionType.Income) {
        incomes += e.value;
      } else if (e.type == TransactionType.Loan) {
        loan += e.value;
      }
    });

    loading = false;
  }
}
