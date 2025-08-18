import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/constraints.dart';

class MyTheme {
  static final borderRadius = BorderRadius.circular(10.0);
  static final theme = ThemeData(
    brightness: Brightness.light,

    // primaryColor: whiteColor,
    scaffoldBackgroundColor: scaffoldColor,
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: whiteColor),

    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      scrolledUnderElevation: 0.0,
      titleTextStyle: GoogleFonts.dmSans(
        color: textColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: const IconThemeData(color: textColor),
      elevation: 0,
    ),
    textTheme: GoogleFonts.dmSansTextTheme(
      TextTheme(
        bodySmall: GoogleFonts.dmSans(fontSize: 14, height: 1.83),
        bodyLarge: GoogleFonts.dmSans(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          height: 1.375,
        ),
        bodyMedium: GoogleFonts.dmSans(fontSize: 14, height: 1.5714),
        labelLarge: GoogleFonts.dmSans(
          fontSize: 16,
          height: 2,
          fontWeight: FontWeight.w600,
        ),
        titleLarge: GoogleFonts.dmSans(
          fontSize: 16,
          height: 2,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 46),
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
      ),
    ),
    textButtonTheme: const TextButtonThemeData(
      style: ButtonStyle(
        shadowColor: WidgetStatePropertyAll(transparent),
        elevation: WidgetStatePropertyAll(0.0),
        iconSize: WidgetStatePropertyAll(20.0),
        splashFactory: NoSplash.splashFactory,
        overlayColor: WidgetStatePropertyAll((transparent)),
        padding: WidgetStatePropertyAll(EdgeInsets.zero),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 3,
      backgroundColor: whiteColor,
      showUnselectedLabels: true,
      selectedLabelStyle: GoogleFonts.dmSans(
        fontWeight: FontWeight.w400,
        color: textColor,
        fontSize: 14.0,
      ),
      unselectedLabelStyle: GoogleFonts.dmSans(
        fontWeight: FontWeight.w400,
        color: textColor,
        fontSize: 14.0,
      ),
      selectedItemColor: textColor,
      unselectedItemColor: textColor,
    ),

    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      hintStyle: GoogleFonts.dmSans(
        fontWeight: FontWeight.w400,
        fontSize: 14.0,
        color: hintTextColor,
      ),
      labelStyle: GoogleFonts.dmSans(
        fontWeight: FontWeight.w400,
        fontSize: 14.0,
        color: textColor,
      ),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 14.0,
        horizontal: 14.0,
      ),
      fillColor: inputFillColor,
      filled: true,
      border: InputBorder.none,
      // No border initially
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.0),
        borderSide: const BorderSide(color: inputFillBorderColor, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.0),
        borderSide: const BorderSide(color: inputFillBorderColor, width: 1),
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: textColor,
      selectionColor: primaryColor.withOpacity(0.5),
      selectionHandleColor: primaryColor,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: primaryColor,
    ),
  );
}
