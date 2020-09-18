import 'package:teste_tonolucro/models/transaction_model.dart';

abstract class ITransactionsRepository {
  Future<List<Transaction>> getAll();
}
