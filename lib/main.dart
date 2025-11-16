import 'package:flutter/material.dart';
import 'data/database.dart';
import 'screens/home_screen.dart';
import 'theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const VaultLensApp());
}

class VaultLensApp extends StatefulWidget {
  const VaultLensApp({super.key});

  @override
  State<VaultLensApp> createState() => _VaultLensAppState();
}

class _VaultLensAppState extends State<VaultLensApp> {
  late final AppDatabase database;

  @override
  void initState() {
    super.initState();
    database = AppDatabase();
  }

  @override
  void dispose() {
    database.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vault Lens',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(database: database),
    );
  }
}
