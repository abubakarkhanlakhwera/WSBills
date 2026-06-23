import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_vibe_coder/theme/app_theme.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;

  test('light theme exposes expected base settings', () {
    final theme = AppTheme.lightTheme();

    expect(theme.useMaterial3, isTrue);
    expect(theme.colorScheme.primary, AppTheme.deepNavy);
    expect(theme.scaffoldBackgroundColor, const Color(0xFFF7FAFF));
  });
}
