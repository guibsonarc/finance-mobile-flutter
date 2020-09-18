// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TransactionsStore on _TransactionsStoreBase, Store {
  final _$transactionsAtom = Atom(name: '_TransactionsStoreBase.transactions');

  @override
  List<Transaction> get transactions {
    _$transactionsAtom.reportRead();
    return super.transactions;
  }

  @override
  set transactions(List<Transaction> value) {
    _$transactionsAtom.reportWrite(value, super.transactions, () {
      super.transactions = value;
    });
  }

  final _$incomesAtom = Atom(name: '_TransactionsStoreBase.incomes');

  @override
  double get incomes {
    _$incomesAtom.reportRead();
    return super.incomes;
  }

  @override
  set incomes(double value) {
    _$incomesAtom.reportWrite(value, super.incomes, () {
      super.incomes = value;
    });
  }

  final _$loanAtom = Atom(name: '_TransactionsStoreBase.loan');

  @override
  double get loan {
    _$loanAtom.reportRead();
    return super.loan;
  }

  @override
  set loan(double value) {
    _$loanAtom.reportWrite(value, super.loan, () {
      super.loan = value;
    });
  }

  final _$expensesAtom = Atom(name: '_TransactionsStoreBase.expenses');

  @override
  double get expenses {
    _$expensesAtom.reportRead();
    return super.expenses;
  }

  @override
  set expenses(double value) {
    _$expensesAtom.reportWrite(value, super.expenses, () {
      super.expenses = value;
    });
  }

  final _$loadingAtom = Atom(name: '_TransactionsStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$loadTransactionsAsyncAction =
      AsyncAction('_TransactionsStoreBase.loadTransactions');

  @override
  Future loadTransactions() {
    return _$loadTransactionsAsyncAction.run(() => super.loadTransactions());
  }

  @override
  String toString() {
    return '''
transactions: ${transactions},
incomes: ${incomes},
loan: ${loan},
expenses: ${expenses},
loading: ${loading}
    ''';
  }
}
