import 'package:teste_tonolucro/models/transaction_model.dart';

abstract class ITransactionsService {
  Future<List<Transaction>> getTransactions();
}
