enum TransactionType { Income, Expenses, Loan }

class Transaction {
  final String description;
  final double value;
  final TransactionType type;

  Transaction(this.description, this.value, this.type);
}
