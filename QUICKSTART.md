# Quick Start Guide - Vault Lens

## For End Users

### What is Vault Lens?
Vault Lens is a simple money tracking app that helps you monitor your account balance and keep track of deposits and withdrawals.

### Getting Started

1. **Install the App**
   - Download the APK file for Android
   - Or build from source (see Developer Setup below)

2. **First Launch**
   - The app will show a balance of $0.00
   - Tap the **+** button in the bottom-right corner

3. **Set Your Initial Balance**
   - Select **"Set Balance"**
   - Enter your current account balance
   - Optionally add a description like "Initial balance"
   - Tap **"Set Balance"** button

4. **Add a Deposit**
   - Tap the **+** button
   - Select **"Add Deposit"**
   - Enter the deposit amount
   - Add a description (e.g., "Salary", "Gift")
   - Tap **"Add Deposit"**

5. **Add a Withdrawal**
   - Tap the **+** button
   - Select **"Add Withdrawal"**
   - Enter the withdrawal amount
   - Add a description (e.g., "Groceries", "Rent")
   - Tap **"Add Withdrawal"**

6. **View Your History**
   - All transactions are listed on the main screen
   - Scroll to see older transactions
   - Each transaction shows:
     - Type (Set, Deposit, or Withdrawal)
     - Amount
     - Description
     - Date and time

### Tips

- **Your balance** is always calculated from all your transactions
- **Green** = Deposits (money coming in)
- **Red** = Withdrawals (money going out)
- **Blue** = Balance set (starting point)
- Tap the **refresh icon** in the top-right to reload your data

---

## For Developers

### Prerequisites
- Flutter SDK (>=3.0.0)
- Android Studio or VS Code
- Android SDK (for Android development)
- Xcode (for iOS development, macOS only)

### Quick Setup

```bash
# 1. Clone the repository
git clone https://github.com/melehova/vault-lens.git
cd vault-lens

# 2. Install dependencies
flutter pub get

# 3. Run on device/emulator
flutter run
```

### Build for Production

```bash
# Android APK (for direct installation)
flutter build apk --release

# Android App Bundle (for Google Play)
flutter build appbundle --release

# iOS (macOS only)
flutter build ios --release
```

### Project Commands

```bash
# Analyze code
flutter analyze

# Run tests
flutter test

# Clean build artifacts
flutter clean

# Get dependencies
flutter pub get

# Upgrade dependencies
flutter pub upgrade
```

### Folder Structure Quick Reference

```
lib/
├── main.dart           # Start here - app entry point
├── data/
│   └── database.dart   # Database schema and operations
├── screens/
│   ├── home_screen.dart           # Main screen
│   └── add_transaction_screen.dart # Transaction form
└── theme/
    └── app_theme.dart  # Colors and typography
```

### Making Your First Change

1. **Change the primary color:**
   - Edit `lib/theme/app_theme.dart`
   - Find `primaryColor = Color(0xFF2E7D32)`
   - Change to your desired color

2. **Add a new field to transactions:**
   - Edit `lib/data/database.dart`
   - Add column to `Transactions` table
   - Increment `schemaVersion`
   - Run `dart run build_runner build`

3. **Modify the UI:**
   - Edit `lib/screens/home_screen.dart`
   - Use hot reload (press `r` in terminal) to see changes instantly

### Helpful Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Drift Documentation](https://drift.simonbinder.eu/)
- [Material Design](https://m3.material.io/)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)

### Common Issues

**Problem**: `flutter: command not found`
- **Solution**: Make sure Flutter is in your PATH. Run `flutter doctor` to check setup.

**Problem**: Dependencies not resolving
- **Solution**: Run `flutter pub get` or `flutter clean && flutter pub get`

**Problem**: Build errors
- **Solution**: Try `flutter clean` then rebuild

**Problem**: Database not working
- **Solution**: Uninstall app and reinstall to reset database

### Need Help?

- Check [DOCUMENTATION.md](DOCUMENTATION.md) for architecture details
- See [CONTRIBUTING.md](CONTRIBUTING.md) for development guidelines
- Open an issue on GitHub for bugs or feature requests

---

## Troubleshooting

### App won't start
1. Check if your device/emulator is connected: `flutter devices`
2. Clean and rebuild: `flutter clean && flutter run`

### Balance is wrong
1. The balance is calculated from ALL transactions
2. If you have a "Set Balance" transaction, it resets the balance at that point
3. Deposits add to balance, withdrawals subtract

### Transactions not showing
1. Pull down on the home screen to refresh
2. Tap the refresh icon in the top-right
3. Check if transactions were saved (they should appear immediately)

### Can't enter decimals in amount
- Make sure you're using a period (.) not a comma (,)
- The app accepts up to 2 decimal places (e.g., 123.45)

---

## FAQ

**Q: Is my data secure?**
A: All data is stored locally on your device using SQLite. Nothing is sent to external servers.

**Q: Can I backup my data?**
A: Currently, there's no built-in backup feature. The database is stored in your app's local storage.

**Q: Can I edit or delete transactions?**
A: Not in the current version. You can add new transactions to correct your balance.

**Q: Does this work offline?**
A: Yes! The app works completely offline. All data is stored locally.

**Q: Can I use this for multiple accounts?**
A: Not yet. This version tracks a single account balance.

**Q: What's the currency?**
A: The app displays $ but works with any currency - just think of the $ as your currency symbol.

---

## Keyboard Shortcuts (Development)

When running the app in debug mode:

- `r` - Hot reload (quickly update UI)
- `R` - Hot restart (full app restart)
- `h` - Help (show all commands)
- `q` - Quit

---

**Enjoy using Vault Lens!** 💰
