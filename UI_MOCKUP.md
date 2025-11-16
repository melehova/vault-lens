# Vault Lens - UI Mockup Description

## Home Screen (Initial State - No Transactions)

```
┌─────────────────────────────────────────┐
│  ☰  Vault Lens                    🔄   │  ← AppBar (Green)
├─────────────────────────────────────────┤
│                                         │
│  ┌───────────────────────────────────┐ │
│  │ Current Balance                   │ │
│  │                                   │ │  ← Balance Card
│  │        $0.00                      │ │    (Green-Blue Gradient)
│  │                                   │ │
│  └───────────────────────────────────┘ │
│                                         │
│         💼                              │
│                                         │
│    No transactions yet                 │  ← Empty State
│                                         │
│  Tap the + button to add a transaction │
│                                         │
│                                         │
│                                         │
│                                         │
│                                  [+]    │  ← FAB (Floating Action Button)
└─────────────────────────────────────────┘
```

## Home Screen (With Transactions)

```
┌─────────────────────────────────────────┐
│  ☰  Vault Lens                    🔄   │  ← AppBar (Green)
├─────────────────────────────────────────┤
│                                         │
│  ┌───────────────────────────────────┐ │
│  │ Current Balance                   │ │
│  │                                   │ │  ← Balance Card
│  │        $1,250.50                  │ │    (Green-Blue Gradient)
│  │                                   │ │
│  └───────────────────────────────────┘ │
│                                         │
│  ┌───────────────────────────────────┐ │
│  │ [+] Deposit          $200.00      │ │  ← Transaction Item
│  │     Monthly salary                │ │    (Green icon & amount)
│  │     Nov 16, 2025 • 02:30 PM      │ │
│  └───────────────────────────────────┘ │
│                                         │
│  ┌───────────────────────────────────┐ │
│  │ [-] Withdrawal        $50.00      │ │  ← Transaction Item
│  │     Groceries                     │ │    (Red icon & amount)
│  │     Nov 15, 2025 • 10:15 AM      │ │
│  └───────────────────────────────────┘ │
│                                         │
│  ┌───────────────────────────────────┐ │
│  │ [⚙] Balance Set    $1,100.50      │ │  ← Transaction Item
│  │     Initial balance               │ │    (Blue icon & amount)
│  │     Nov 14, 2025 • 09:00 AM      │ │
│  └───────────────────────────────────┘ │
│                                         │
│                                  [+]    │  ← FAB
└─────────────────────────────────────────┘
```

## Transaction Type Selection Modal

```
┌─────────────────────────────────────────┐
│                 ────                    │  ← Handle
│                                         │
│      Select Transaction Type            │  ← Modal Header
│                                         │
│  ┌───────────────────────────────────┐ │
│  │ [⚙]  Set Balance              →  │ │  ← Option (Blue)
│  │      Set a new balance amount     │ │
│  └───────────────────────────────────┘ │
│                                         │
│  ┌───────────────────────────────────┐ │
│  │ [+]  Add Deposit              →  │ │  ← Option (Green)
│  │      Add money to your balance    │ │
│  └───────────────────────────────────┘ │
│                                         │
│  ┌───────────────────────────────────┐ │
│  │ [-]  Add Withdrawal           →  │ │  ← Option (Red)
│  │      Remove money from balance    │ │
│  └───────────────────────────────────┘ │
│                                         │
└─────────────────────────────────────────┘
```

## Add Transaction Screen (Deposit Example)

```
┌─────────────────────────────────────────┐
│  ←  Add Deposit                         │  ← AppBar (Green)
├─────────────────────────────────────────┤
│                                         │
│  ┌───────────────────────────────────┐ │
│  │                                   │ │
│  │         ┌─────────┐               │ │
│  │         │         │               │ │  ← Icon Display
│  │         │   [+]   │               │ │    (Green Circle)
│  │         │         │               │ │
│  │         └─────────┘               │ │
│  │                                   │ │
│  │      Add Deposit                  │ │
│  │                                   │ │
│  └───────────────────────────────────┘ │
│                                         │
│  ┌───────────────────────────────────┐ │
│  │ 💲 Amount                         │ │  ← Amount Input
│  │   $ 200.00                        │ │    (Number keyboard)
│  └───────────────────────────────────┘ │
│                                         │
│  ┌───────────────────────────────────┐ │
│  │ 📝 Description (Optional)         │ │  ← Description Input
│  │   Monthly salary                  │ │    (Multiline text)
│  │                                   │ │
│  └───────────────────────────────────┘ │
│                                         │
│  ┌───────────────────────────────────┐ │
│  │      Add Deposit                  │ │  ← Submit Button
│  └───────────────────────────────────┘ │    (Green background)
│                                         │
└─────────────────────────────────────────┘
```

## Add Transaction Screen (Withdrawal Example)

```
┌─────────────────────────────────────────┐
│  ←  Add Withdrawal                      │  ← AppBar (Red)
├─────────────────────────────────────────┤
│                                         │
│  ┌───────────────────────────────────┐ │
│  │                                   │ │
│  │         ┌─────────┐               │ │
│  │         │         │               │ │  ← Icon Display
│  │         │   [-]   │               │ │    (Red Circle)
│  │         │         │               │ │
│  │         └─────────┘               │ │
│  │                                   │ │
│  │      Add Withdrawal               │ │
│  │                                   │ │
│  └───────────────────────────────────┘ │
│                                         │
│  ┌───────────────────────────────────┐ │
│  │ 💲 Amount                         │ │  ← Amount Input
│  │   $ 50.00                         │ │
│  └───────────────────────────────────┘ │
│                                         │
│  ┌───────────────────────────────────┐ │
│  │ 📝 Description (Optional)         │ │  ← Description Input
│  │   Groceries                       │ │
│  │                                   │ │
│  └───────────────────────────────────┘ │
│                                         │
│  ┌───────────────────────────────────┐ │
│  │      Add Withdrawal               │ │  ← Submit Button
│  └───────────────────────────────────┘ │    (Red background)
│                                         │
└─────────────────────────────────────────┘
```

## Add Transaction Screen (Set Balance Example)

```
┌─────────────────────────────────────────┐
│  ←  Set Balance                         │  ← AppBar (Blue)
├─────────────────────────────────────────┤
│                                         │
│  ┌───────────────────────────────────┐ │
│  │                                   │ │
│  │         ┌─────────┐               │ │
│  │         │         │               │ │  ← Icon Display
│  │         │   [⚙]   │               │ │    (Blue Circle)
│  │         │         │               │ │
│  │         └─────────┘               │ │
│  │                                   │ │
│  │      Set Balance                  │ │
│  │                                   │ │
│  └───────────────────────────────────┘ │
│                                         │
│  ┌───────────────────────────────────┐ │
│  │ 💲 Amount                         │ │  ← Amount Input
│  │   $ 1100.50                       │ │
│  └───────────────────────────────────┘ │
│                                         │
│  ┌───────────────────────────────────┐ │
│  │ 📝 Description (Optional)         │ │  ← Description Input
│  │   Initial balance                 │ │
│  │                                   │ │
│  └───────────────────────────────────┘ │
│                                         │
│  ┌───────────────────────────────────┐ │
│  │      Set Balance                  │ │  ← Submit Button
│  └───────────────────────────────────┘ │    (Blue background)
│                                         │
└─────────────────────────────────────────┘
```

## Color Legend

- **Green (#2E7D32)**: Primary color, deposit transactions
- **Blue (#1565C0)**: Secondary color, set balance transactions
- **Red (#F44336)**: Withdrawal transactions
- **Light Gray (#F5F5F5)**: Background
- **White (#FFFFFF)**: Cards and input fields

## Typography

All text uses **Poppins** font family:
- **Headlines**: Bold (700), 24-36px
- **Titles**: SemiBold (600), 18-22px
- **Body**: Regular (400), 14-16px
- **Captions**: Regular (400), 12px

## Interactions

1. **Tap FAB (+)**: Opens transaction type selection modal
2. **Tap Transaction Type**: Opens add transaction screen
3. **Fill Amount & Description**: Enter transaction details
4. **Tap Submit Button**: Saves transaction and returns to home
5. **Tap Refresh Button**: Reloads balance and transactions
6. **Swipe/Pull Down**: Refreshes data (standard Flutter behavior)

## Responsive Design

- The app adapts to different screen sizes
- Cards have consistent 16px horizontal margins
- Text scales appropriately on different devices
- All touch targets are at least 48x48dp (Material Design standard)
