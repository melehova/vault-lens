import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../data/database.dart';
import '../theme/app_theme.dart';
import 'add_transaction_screen.dart';

class HomeScreen extends StatefulWidget {
  final AppDatabase database;

  const HomeScreen({super.key, required this.database});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _currentBalance = 0.0;
  List<Transaction> _transactions = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);
    try {
      final balance = await widget.database.getCurrentBalance();
      final transactions = await widget.database.getAllTransactions();
      setState(() {
        _currentBalance = balance;
        _transactions = transactions;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error loading data: $e')),
        );
      }
    }
  }

  void _showTransactionOptions() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Select Transaction Type',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            _buildTransactionOption(
              icon: Icons.settings,
              title: 'Set Balance',
              subtitle: 'Set a new balance amount',
              color: AppTheme.setBalanceColor,
              onTap: () {
                Navigator.pop(context);
                _navigateToTransaction('set');
              },
            ),
            const SizedBox(height: 12),
            _buildTransactionOption(
              icon: Icons.add_circle,
              title: 'Add Deposit',
              subtitle: 'Add money to your balance',
              color: AppTheme.depositColor,
              onTap: () {
                Navigator.pop(context);
                _navigateToTransaction('deposit');
              },
            ),
            const SizedBox(height: 12),
            _buildTransactionOption(
              icon: Icons.remove_circle,
              title: 'Add Withdrawal',
              subtitle: 'Remove money from your balance',
              color: AppTheme.withdrawalColor,
              onTap: () {
                Navigator.pop(context);
                _navigateToTransaction('withdrawal');
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: color, size: 28),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[400]),
          ],
        ),
      ),
    );
  }

  Future<void> _navigateToTransaction(String type) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddTransactionScreen(
          database: widget.database,
          transactionType: type,
        ),
      ),
    );
    if (result == true) {
      _loadData();
    }
  }

  String _formatCurrency(double amount) {
    final formatter = NumberFormat.currency(symbol: '\$', decimalDigits: 2);
    return formatter.format(amount);
  }

  String _formatDate(DateTime date) {
    return DateFormat('MMM dd, yyyy • hh:mm a').format(date);
  }

  Color _getTransactionColor(String type) {
    switch (type) {
      case 'deposit':
        return AppTheme.depositColor;
      case 'withdrawal':
        return AppTheme.withdrawalColor;
      case 'set':
        return AppTheme.setBalanceColor;
      default:
        return AppTheme.textSecondary;
    }
  }

  IconData _getTransactionIcon(String type) {
    switch (type) {
      case 'deposit':
        return Icons.add_circle;
      case 'withdrawal':
        return Icons.remove_circle;
      case 'set':
        return Icons.settings;
      default:
        return Icons.help;
    }
  }

  String _getTransactionTitle(String type) {
    switch (type) {
      case 'deposit':
        return 'Deposit';
      case 'withdrawal':
        return 'Withdrawal';
      case 'set':
        return 'Balance Set';
      default:
        return 'Transaction';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vault Lens'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadData,
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                // Balance Card
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [AppTheme.primaryColor, AppTheme.secondaryColor],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.primaryColor.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Current Balance',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: AppTheme.textLight.withOpacity(0.9),
                            ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _formatCurrency(_currentBalance),
                        style: Theme.of(context).textTheme.displayMedium?.copyWith(
                              color: AppTheme.textLight,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
                
                // Transactions List
                Expanded(
                  child: _transactions.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.account_balance_wallet,
                                size: 64,
                                color: Colors.grey[400],
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'No transactions yet',
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      color: AppTheme.textSecondary,
                                    ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Tap the + button to add a transaction',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.only(bottom: 80),
                          itemCount: _transactions.length,
                          itemBuilder: (context, index) {
                            final transaction = _transactions[index];
                            final color = _getTransactionColor(transaction.type);
                            final icon = _getTransactionIcon(transaction.type);
                            final title = _getTransactionTitle(transaction.type);
                            
                            return Card(
                              child: ListTile(
                                leading: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: color.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Icon(icon, color: color),
                                ),
                                title: Text(title),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (transaction.description != null)
                                      Text(transaction.description!),
                                    Text(
                                      _formatDate(transaction.createdAt),
                                      style: Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                                trailing: Text(
                                  _formatCurrency(transaction.amount),
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                        color: color,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showTransactionOptions,
        child: const Icon(Icons.add),
      ),
    );
  }
}
