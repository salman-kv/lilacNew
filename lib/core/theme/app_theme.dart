import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lilac/core/theme/app_color.dart';

class AppTheme {
  static ThemeData light = ThemeData.light().copyWith(
      scaffoldBackgroundColor: AppColor.bgColor,
      textTheme: GoogleFonts.poppinsTextTheme().copyWith(
        titleMedium: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
        titleSmall: const TextStyle(
            fontWeight: FontWeight.w500, fontSize: 12, color: Colors.black),
      ));
}
