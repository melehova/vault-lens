import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

// Define the Transactions table
class Transactions extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get type => text()(); // 'set', 'deposit', 'withdrawal'
  RealColumn get amount => real()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get description => text().nullable()();
}

// The generated database class
@DriftDatabase(tables: [Transactions])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // Get current balance by summing all transactions
  Future<double> getCurrentBalance() async {
    final transactions = await select(this.transactions).get();
    
    double balance = 0.0;
    for (var transaction in transactions) {
      switch (transaction.type) {
        case 'set':
          balance = transaction.amount;
          break;
        case 'deposit':
          balance += transaction.amount;
          break;
        case 'withdrawal':
          balance -= transaction.amount;
          break;
      }
    }
    return balance;
  }

  // Set balance (resets to a specific amount)
  Future<int> setBalance(double amount, {String? description}) {
    return into(transactions).insert(
      TransactionsCompanion.insert(
        type: 'set',
        amount: amount,
        description: Value(description),
      ),
    );
  }

  // Add deposit
  Future<int> addDeposit(double amount, {String? description}) {
    return into(transactions).insert(
      TransactionsCompanion.insert(
        type: 'deposit',
        amount: amount,
        description: Value(description),
      ),
    );
  }

  // Add withdrawal
  Future<int> addWithdrawal(double amount, {String? description}) {
    return into(transactions).insert(
      TransactionsCompanion.insert(
        type: 'withdrawal',
        amount: amount,
        description: Value(description),
      ),
    );
  }

  // Get all transactions ordered by date (most recent first)
  Future<List<Transaction>> getAllTransactions() {
    return (select(transactions)
          ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
        .get();
  }

  // Delete a transaction
  Future<int> deleteTransaction(int id) {
    return (delete(transactions)..where((t) => t.id.equals(id))).go();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'vault_lens.db'));
    return NativeDatabase(file);
  });
}
