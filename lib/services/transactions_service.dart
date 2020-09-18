import 'package:teste_tonolucro/interfaces/transactions_repository_interface.dart';
import 'package:teste_tonolucro/interfaces/transactions_service_interface.dart';
import 'package:teste_tonolucro/models/transaction_model.dart';

class TransactionsService implements ITransactionsService {
  final ITransactionsRepository _repository;

  TransactionsService(this._repository);

  @override
  Future<List<Transaction>> getTransactions() async {
    return await _repository.getAll();
  }
}
