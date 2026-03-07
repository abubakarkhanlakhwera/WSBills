import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'screens/home_screen.dart';
import 'services/bill_service.dart';
import 'theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  String? startupError;

  try {
    await dotenv.load(fileName: '.env');

    final supabaseUrl = dotenv.get('SUPABASE_URL', fallback: '');
    final supabaseAnonKey = dotenv.get('SUPABASE_ANON_KEY', fallback: '');

    if (supabaseUrl.isEmpty || supabaseAnonKey.isEmpty) {
      startupError = 'Supabase env values are missing. Update .env before searching.';
    } else {
      await Supabase.initialize(
        url: supabaseUrl,
        anonKey: supabaseAnonKey,
      );
    }
  } catch (_) {
    startupError = 'Failed to initialize Supabase. Verify .env values and network.';
  }

  runApp(WSBillsApp(startupError: startupError));
}

class WSBillsApp extends StatelessWidget {
  const WSBillsApp({
    super.key,
    this.startupError,
  });

  final String? startupError;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WSBills',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(),
      home: HomeScreen(
        billService: BillService(),
        startupError: startupError,
      ),
    );
  }
}
