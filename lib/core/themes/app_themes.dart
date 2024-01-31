import 'package:flutter/material.dart';

import '../constants/my_colors.dart';

class AppThemes {
  AppThemes._();
  static final light = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: MyColors.primaryColor),
    useMaterial3: true,
    //fontFamily: GoogleFonts.poppins(fontSize: 24).fontFamily,
  );
  static final dark = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: MyColors.secondaryColor),
    useMaterial3: true,
    //fontFamily: GoogleFonts.poppins().fontFamily
  );
}
