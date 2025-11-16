# Contributing to Vault Lens

Thank you for your interest in contributing to Vault Lens!

## Development Setup

1. **Install Flutter SDK** (version >=3.0.0)
   - Follow the [official Flutter installation guide](https://flutter.dev/docs/get-started/install)

2. **Clone the repository**
   ```bash
   git clone https://github.com/melehova/vault-lens.git
   cd vault-lens
   ```

3. **Install dependencies**
   ```bash
   flutter pub get
   ```

4. **Generate database code** (if you modify database.dart)
   ```bash
   dart run build_runner build
   ```

5. **Run the app**
   ```bash
   flutter run
   ```

## Code Style

- Follow the [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)
- Use the provided `analysis_options.yaml` for linting
- Run `flutter analyze` before committing

## Making Changes

1. Create a new branch for your feature
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. Make your changes and test thoroughly

3. Run linter and tests
   ```bash
   flutter analyze
   flutter test
   ```

4. Commit your changes with a clear message
   ```bash
   git commit -m "Add: description of your changes"
   ```

5. Push to your fork and create a Pull Request

## Database Changes

If you modify the database schema in `lib/data/database.dart`:

1. Update the `schemaVersion` in the `AppDatabase` class
2. Regenerate the code:
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```
3. Add migration logic if needed

## UI/UX Guidelines

- Maintain consistency with the existing color theme
- Use the predefined colors from `app_theme.dart`
- Ensure all interactive elements have appropriate feedback
- Test on different screen sizes
- Follow Material Design 3 guidelines

## Testing

- Write unit tests for new business logic
- Test database operations thoroughly
- Verify UI changes on both Android and iOS (if applicable)

## Questions?

Feel free to open an issue for any questions or concerns.
