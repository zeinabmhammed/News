import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color light = Color(0xFFFFFFFF);
  static const Color dark = Color(0xFF171717);
}
//--------------------------------------------------------------------------------

class AppImages{
  //splash screen
  static const String splashLogo = "assets/images/splash_logo.png";

  // lightImage
  static const String generalLight = "assets/images/generalLight.png";
  static const String businessLight = "assets/images/busniessLight.png";
  static const String sportsLight = "assets/images/entertainmentLight.png";
  static const String healthLight = "assets/images/healthLight.png";
  static const String entertainmentLight = "assets/images/entertainmentLight.png";
  static const String technologyLight = "assets/images/technologyLight.png";
  static const String scienceLight = "assets/images/scienceLight.png";


  //darkImage
  static const String generalImage = "assets/images/general_dark.png";
  static const String businessImage = "assets/images/busniess_dark.png";
  static const String entertainmentImage = "assets/images/entertainment_dark.png";
  static const String healthImage = "assets/images/health_dark.png";
  static const String scienceImage = "assets/images/science_dark.png";
  static const String technologyImage = "assets/images/technology_dark.png";
  static const String sportsImage = "assets/images/sport_dark.png";


  //icons
  static const String homeIcon = "assets/svg/Home 1.svg";
  static const String languageIcon = "assets/svg/icon.svg";
  static const String themeIcon = "assets/svg/roller-paint-brush.svg";

}
//----------------------------------------------------------------------------------------------
class AppThemes{
  static var lightTheme = ThemeData(

    colorScheme: ColorScheme.light(
        primary: AppColors.light
    ),

    brightness: Brightness.light,

    //Appbar theme
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.light,
      surfaceTintColor: Colors.transparent,

      titleTextStyle: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: AppColors.dark,
      ),

      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.dark),
    ),

    //Text theme
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.inter(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),

      titleLarge: GoogleFonts.inter(
        color: AppColors.dark,
        fontSize: 24,
        fontWeight: FontWeight.w500,
        letterSpacing: 0,
      ),

      titleMedium: GoogleFonts.inter(
        color: AppColors.dark,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        letterSpacing: 0,
      ),

      titleSmall: GoogleFonts.inter(
        color: AppColors.dark,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        letterSpacing: 0,
      ),
    ),

    //Elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16),
        backgroundColor: AppColors.light,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)
        ),
        textStyle: GoogleFonts.inter(
          color: AppColors.dark,
          fontSize: 20,
          fontWeight: FontWeight.w500,
          letterSpacing: 0,
        ),
      ),
    ),

    //Bottom navigation bar theme
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.light,
      selectedIconTheme: IconThemeData(
        color: AppColors.light,
        size: 33,
      ),
      unselectedIconTheme: IconThemeData(color: AppColors.dark, size: 27),
      selectedLabelStyle: TextStyle(
        color: AppColors.light,
        fontSize: 12,
        fontWeight: FontWeight.bold,
        letterSpacing: 0,
      ),
      unselectedLabelStyle: TextStyle(
        color: AppColors.dark,
        fontSize: 12,
        fontWeight: FontWeight.bold,
        letterSpacing: 0,
      ),
    ),

    // Bottom app bar theme
    bottomAppBarTheme: BottomAppBarThemeData(color: AppColors.dark),

    //Scaffold background color
    scaffoldBackgroundColor: AppColors.light,
  );
//--------------------------------------------------------------------------------------------
  static var darkTheme = ThemeData(

    colorScheme: ColorScheme.dark(
        primary: AppColors.dark
    ),

    brightness: Brightness.dark,

    // Appbar theme
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.dark,
      surfaceTintColor: Colors.transparent,

      titleTextStyle: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: AppColors.light,
      ),

      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.light),
    ),

    //Text theme
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.inter(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),

      titleLarge: GoogleFonts.inter(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
        letterSpacing: 0,
      ),

      titleMedium: GoogleFonts.inter(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        letterSpacing: 0,
      ),

      titleSmall: GoogleFonts.inter(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        letterSpacing: 0,
      ),
    ),

    //Elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16),
        backgroundColor: AppColors.dark,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        textStyle: GoogleFonts.inter(
          color: AppColors.light,
          fontSize: 20,
          fontWeight: FontWeight.w500,
          letterSpacing: 0,
        ),
      ),
    ),

    //Bottom navigation bar theme
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.dark,
      selectedIconTheme: IconThemeData(
        color: AppColors.light,
        size: 33,
      ),
      unselectedIconTheme: IconThemeData(color:Colors.white, size: 27),
      selectedLabelStyle: TextStyle(
        color: AppColors.light,
        fontSize: 12,
        fontWeight: FontWeight.bold,
        letterSpacing: 0,
      ),
      unselectedLabelStyle: TextStyle(
        color:Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.bold,
        letterSpacing: 0,
      ),
    ),

    // Bottom app bar theme
    bottomAppBarTheme: BottomAppBarThemeData(color: AppColors.light),

    //Scaffold background color
    scaffoldBackgroundColor: AppColors.dark,
  );
}