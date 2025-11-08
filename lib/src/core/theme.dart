import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color _primaryColor = Color(0xFF4A90E2);
  static const Color _scaffoldBackgroundColor = Color(0xFFF5F7FA);
  static const Color _textColor = Color(0xFF333333);

  static final TextTheme _textTheme = TextTheme(
    headlineLarge: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 32, color: _textColor),
    headlineMedium: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 24, color: _textColor),
    headlineSmall: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 20, color: _textColor),
    titleLarge: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 18, color: _textColor),
    titleMedium: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 16, color: _textColor),
    bodyLarge: GoogleFonts.lato(fontSize: 16, color: _textColor),
    bodyMedium: GoogleFonts.lato(fontSize: 14, color: _textColor),
    labelLarge: GoogleFonts.lato(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),
  );

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: _primaryColor,
    scaffoldBackgroundColor: _scaffoldBackgroundColor,
    textTheme: _textTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: const IconThemeData(color: _textColor),
      titleTextStyle: _textTheme.headlineSmall?.copyWith(color: _textColor),
    ),
    cardTheme: CardThemeData(
      elevation: 1,
      shadowColor: Colors.grey.withAlpha(25),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200, width: 1),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        textStyle: _textTheme.labelLarge,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: _primaryColor, width: 2),
      ),
      labelStyle: _textTheme.bodyMedium,
    ),
    chipTheme: ChipThemeData(
      backgroundColor: _primaryColor.withAlpha(25),
      labelStyle: _textTheme.bodyMedium?.copyWith(color: _primaryColor),
      selectedColor: _primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: _primaryColor, width: 1),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    // Define dark theme properties here if needed
    // For now, we will just use the light theme
    useMaterial3: true,
    brightness: Brightness.dark,
  );
}
