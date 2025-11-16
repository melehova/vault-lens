# Vault Lens - App Documentation

## Architecture Overview

### Layer Structure
```
┌─────────────────────────────────────┐
│         Presentation Layer          │
│  (Screens, Widgets, Theme)          │
├─────────────────────────────────────┤
│         Business Logic Layer        │
│  (Database Operations)              │
├─────────────────────────────────────┤
│         Data Layer                  │
│  (Drift Database, SQLite)           │
└─────────────────────────────────────┘
```

## App Flow

### Main Flow
1. **App Start** → `main.dart` initializes the database
2. **Home Screen** → Shows current balance and transaction list
3. **User Action** → Taps FAB to add transaction
4. **Transaction Selection** → Modal sheet shows three options:
   - Set Balance
   - Add Deposit
   - Add Withdrawal
5. **Transaction Form** → User fills amount and optional description
6. **Submit** → Transaction saved to database
7. **Home Screen** → Refreshes with updated balance and transaction list

### Screen Navigation
```
main.dart
   ↓
HomeScreen
   ├→ AddTransactionScreen (type: 'set')
   ├→ AddTransactionScreen (type: 'deposit')
   └→ AddTransactionScreen (type: 'withdrawal')
```

## Database Operations

### Transaction Types
1. **Set Balance** (`type: 'set'`)
   - Resets balance to specific amount
   - Example: User sets balance to $1000

2. **Deposit** (`type: 'deposit'`)
   - Adds amount to current balance
   - Example: User deposits $200, balance increases

3. **Withdrawal** (`type: 'withdrawal'`)
   - Subtracts amount from current balance
   - Example: User withdraws $50, balance decreases

### Balance Calculation
The current balance is calculated by processing all transactions in chronological order:
```dart
balance = 0
for each transaction:
  if type == 'set': balance = amount
  if type == 'deposit': balance += amount
  if type == 'withdrawal': balance -= amount
```

## UI Components

### HomeScreen Components
- **AppBar**: Title and refresh button
- **Balance Card**: 
  - Gradient background (green to blue)
  - Large display of current balance
  - Formatted as currency ($X,XXX.XX)
- **Transaction List**:
  - Each transaction shows:
    - Icon (color-coded by type)
    - Transaction type and description
    - Date and time
    - Amount (color-coded)
- **FAB**: Floating action button to add new transaction

### AddTransactionScreen Components
- **AppBar**: Color-coded by transaction type
- **Icon Display**: Large icon showing transaction type
- **Amount Input**: 
  - Number keyboard
  - Currency prefix ($)
  - Decimal validation (max 2 decimal places)
- **Description Input**: 
  - Optional text field
  - Multi-line (3 lines)
- **Submit Button**: 
  - Color-coded by transaction type
  - Loading indicator during submission

## Theme Configuration

### Color Palette
| Usage | Color | Hex Code |
|-------|-------|----------|
| Primary (Money) | Green | #2E7D32 |
| Secondary | Blue | #1565C0 |
| Accent | Orange | #FFA726 |
| Deposit | Light Green | #4CAF50 |
| Withdrawal | Red | #F44336 |
| Set Balance | Blue | #2196F3 |
| Background | Light Gray | #F5F5F5 |
| Card | White | #FFFFFF |

### Typography
- **Font Family**: Poppins (via Google Fonts)
- **Weights Used**: Regular (400), Medium (500), SemiBold (600), Bold (700)
- **Sizes**: 
  - Display: 36-57px
  - Headlines: 24-32px
  - Body: 14-16px
  - Labels: 11-14px

## File Structure

```
vault_lens/
├── lib/
│   ├── main.dart                    # App entry point
│   ├── data/
│   │   ├── database.dart            # Drift schema & operations
│   │   └── database.g.dart          # Generated Drift code
│   ├── screens/
│   │   ├── home_screen.dart         # Main balance display
│   │   └── add_transaction_screen.dart  # Transaction form
│   └── theme/
│       └── app_theme.dart           # Custom theme config
├── android/                         # Android configuration
├── ios/                             # iOS configuration
├── test/
│   └── database_test.dart           # Database tests
├── pubspec.yaml                     # Dependencies
└── README.md                        # Project documentation
```

## Key Dependencies

| Package | Purpose | Version |
|---------|---------|---------|
| flutter | Framework | SDK |
| drift | SQLite ORM | ^2.14.0 |
| sqlite3_flutter_libs | SQLite native | ^0.5.0 |
| path_provider | File paths | ^2.1.1 |
| intl | Date/number formatting | ^0.18.1 |
| google_fonts | Custom fonts | ^6.1.0 |
| build_runner | Code generation | ^2.4.7 |
| drift_dev | Drift codegen | ^2.14.0 |

## Development Commands

```bash
# Get dependencies
flutter pub get

# Generate database code (if build_runner available)
dart run build_runner build

# Run app
flutter run

# Build for Android
flutter build apk
flutter build appbundle

# Run tests
flutter test
```

## Future Enhancements

Potential features for future development:
- [ ] Transaction categories (groceries, rent, salary, etc.)
- [ ] Date range filtering
- [ ] Export transactions to CSV
- [ ] Charts and analytics
- [ ] Multiple accounts support
- [ ] Backup and restore functionality
- [ ] Dark theme support
- [ ] Biometric authentication
- [ ] Recurring transactions
- [ ] Budget tracking
