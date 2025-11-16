# Vault Lens

A Flutter application to monitor money account balance with transaction tracking.

## Features

- **Set Balance**: Set your account balance to a specific amount
- **Add Deposit**: Record deposits to increase your balance
- **Add Withdrawal**: Record withdrawals to decrease your balance
- **Transaction History**: View all your transactions with timestamps and descriptions
- **Custom Theme**: Beautiful green/blue gradient theme designed for financial apps
- **Persistent Storage**: Uses Drift (SQLite) database for data persistence

## Technical Stack

- **Framework**: Flutter
- **Database**: Drift (SQLite)
- **State Management**: StatefulWidget
- **Fonts**: Google Fonts (Poppins)
- **Platform**: Primarily Android (iOS compatible)

## Project Structure

```
lib/
├── data/
│   └── database.dart          # Drift database schema and operations
├── screens/
│   ├── home_screen.dart       # Main screen showing balance and transactions
│   └── add_transaction_screen.dart  # Screen for adding transactions
├── theme/
│   └── app_theme.dart         # Custom color theme and styling
└── main.dart                  # App entry point
```

## Getting Started

### Prerequisites

- Flutter SDK (>=3.0.0)
- Android SDK (for Android development)
- Xcode (for iOS development, macOS only)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/melehova/vault-lens.git
cd vault-lens
```

2. Install dependencies:
```bash
flutter pub get
```

3. Generate Drift database code:
```bash
dart run build_runner build
```

### Running the App

For Android:
```bash
flutter run
```

For iOS:
```bash
flutter run -d ios
```

### Building

For Android APK:
```bash
flutter build apk
```

For Android App Bundle:
```bash
flutter build appbundle
```

For iOS:
```bash
flutter build ios
```

## Database Schema

The app uses a single table `transactions` with the following fields:

- `id`: Auto-incrementing primary key
- `type`: Transaction type ('set', 'deposit', 'withdrawal')
- `amount`: Transaction amount (decimal)
- `createdAt`: Timestamp of the transaction
- `description`: Optional description

## Custom Theme

The app features a custom color theme with:

- **Primary Color**: Green (#2E7D32) - representing money/finance
- **Secondary Color**: Blue (#1565C0)
- **Accent Color**: Orange (#FFA726)
- **Custom Font**: Poppins (via Google Fonts)
- **Transaction Colors**:
  - Deposit: Green (#4CAF50)
  - Withdrawal: Red (#F44336)
  - Set Balance: Blue (#2196F3)

## Screenshots

The app features:
- A gradient balance card displaying the current balance
- A list of all transactions with color-coded icons
- Modal bottom sheet for selecting transaction type
- Dedicated screens for each transaction type with validation

## License

This project is licensed under the MIT License.