import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../data/database.dart';
import '../theme/app_theme.dart';

class AddTransactionScreen extends StatefulWidget {
  final AppDatabase database;
  final String transactionType; // 'set', 'deposit', or 'withdrawal'

  const AddTransactionScreen({
    super.key,
    required this.database,
    required this.transactionType,
  });

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _amountController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  String get _title {
    switch (widget.transactionType) {
      case 'set':
        return 'Set Balance';
      case 'deposit':
        return 'Add Deposit';
      case 'withdrawal':
        return 'Add Withdrawal';
      default:
        return 'Transaction';
    }
  }

  Color get _color {
    switch (widget.transactionType) {
      case 'set':
        return AppTheme.setBalanceColor;
      case 'deposit':
        return AppTheme.depositColor;
      case 'withdrawal':
        return AppTheme.withdrawalColor;
      default:
        return AppTheme.primaryColor;
    }
  }

  IconData get _icon {
    switch (widget.transactionType) {
      case 'set':
        return Icons.settings;
      case 'deposit':
        return Icons.add_circle;
      case 'withdrawal':
        return Icons.remove_circle;
      default:
        return Icons.help;
    }
  }

  String get _buttonText {
    switch (widget.transactionType) {
      case 'set':
        return 'Set Balance';
      case 'deposit':
        return 'Add Deposit';
      case 'withdrawal':
        return 'Add Withdrawal';
      default:
        return 'Submit';
    }
  }

  Future<void> _submitTransaction() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final amount = double.parse(_amountController.text);
    final description = _descriptionController.text.trim().isEmpty
        ? null
        : _descriptionController.text.trim();

    setState(() => _isLoading = true);

    try {
      switch (widget.transactionType) {
        case 'set':
          await widget.database.setBalance(amount, description: description);
          break;
        case 'deposit':
          await widget.database.addDeposit(amount, description: description);
          break;
        case 'withdrawal':
          await widget.database.addWithdrawal(amount, description: description);
          break;
      }

      if (mounted) {
        Navigator.pop(context, true);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Transaction added successfully'),
            backgroundColor: AppTheme.successColor,
          ),
        );
      }
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
            backgroundColor: AppTheme.errorColor,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        backgroundColor: _color,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Icon and title
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: _color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: _color.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        _icon,
                        size: 48,
                        color: _color,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      _title,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: _color,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Amount field
              TextFormField(
                controller: _amountController,
                decoration: InputDecoration(
                  labelText: 'Amount',
                  hintText: 'Enter amount',
                  prefixIcon: Icon(Icons.attach_money, color: _color),
                  prefixText: '\$ ',
                ),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an amount';
                  }
                  final amount = double.tryParse(value);
                  if (amount == null) {
                    return 'Please enter a valid number';
                  }
                  if (amount <= 0) {
                    return 'Amount must be greater than zero';
                  }
                  return null;
                },
                autofocus: true,
              ),
              
              const SizedBox(height: 16),
              
              // Description field
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description (Optional)',
                  hintText: 'Add a note',
                  prefixIcon: Icon(Icons.note, color: _color),
                ),
                maxLines: 3,
                textCapitalization: TextCapitalization.sentences,
              ),
              
              const SizedBox(height: 32),
              
              // Submit button
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _submitTransaction,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _color,
                  ),
                  child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : Text(
                          _buttonText,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
