import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeManager {
  static ThemeData getTheme() {
    return ThemeData(
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: _darkGreyColor.shade50,
        ),
        titleTextStyle: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        color: accentColor,
      ),
      floatingActionButtonTheme:
          const FloatingActionButtonThemeData(backgroundColor: accentColor),
      dialogTheme: DialogTheme(
        titleTextStyle: TextStyle(
          color: _darkGreyColor.shade800,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
        contentTextStyle: TextStyle(
          color: _darkGreyColor.shade800,
          fontSize: 14.0,
        ),
      ),
      brightness: Brightness.dark,
      scaffoldBackgroundColor: _darkGreyColor.shade100,
      backgroundColor: _darkGreyColor.shade100,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(
            color: _darkGreyColor.shade500,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(
            color: _darkGreyColor.shade500,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(
            color: _darkGreyColor.shade900,
            width: 2,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
        isDense: true,
        hintStyle: TextStyle(fontSize: 14, color: _darkGreyColor.shade500),
        labelStyle: TextStyle(fontSize: 14, color: _darkGreyColor.shade500),
      ),
      errorColor: Colors.red,
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.transparent,
      ),
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 0.5,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      snackBarTheme: SnackBarThemeData(
        actionTextColor: _lightGreyColor.shade50,
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: accentColor,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: _darkAccentColor,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      textTheme: TextTheme(
        headline5: TextStyle(
          color: _darkGreyColor.shade900,
          fontSize: 22.0,
        ),
        subtitle1: TextStyle(
          color: _darkGreyColor.shade900,
          fontSize: 18.0,
        ),
        headline6: TextStyle(
          color: _darkGreyColor.shade900,
          fontSize: 20.0,
        ),
        subtitle2: TextStyle(
          color: _darkGreyColor.shade900,
          fontSize: 16.0,
        ),
        overline: TextStyle(
          color: _darkGreyColor.shade900,
          fontSize: 12.0,
        ),
        bodyText2: TextStyle(
          color: _darkGreyColor.shade900,
          fontSize: 14.0,
        ),
        bodyText1: TextStyle(
          color: _darkGreyColor.shade900,
          fontSize: 14.0,
        ),
        headline4: TextStyle(
          color: _darkGreyColor.shade900,
          fontSize: 20.0,
        ),
        headline3: TextStyle(
          color: _darkGreyColor.shade900,
          fontSize: 22.0,
        ),
        headline2: TextStyle(
          color: _darkGreyColor.shade900,
          fontSize: 24.0,
        ),
        headline1: TextStyle(
          color: _darkGreyColor.shade900,
          fontSize: 26.0,
        ),
        caption: TextStyle(
          color: _darkGreyColor.shade900,
          fontSize: 13.0,
        ),
        button: TextStyle(
          color: _darkGreyColor.shade900,
          fontWeight: FontWeight.bold,
        ),
      ).apply(),
      primaryColor: _darkGreyColor.shade50,
      iconTheme: IconThemeData(color: _darkGreyColor.shade900),
      primaryIconTheme: const IconThemeData(color: primaryColor),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        unselectedIconTheme: IconThemeData(
          color: _darkGreyColor[800],
        ),
        selectedIconTheme: const IconThemeData(
          color: primaryColor,
        ),
        unselectedItemColor: _darkGreyColor[800],
        selectedItemColor: primaryColor,
        type: BottomNavigationBarType.fixed,
        elevation: 15.0,
      ),
      bottomAppBarColor: _darkGreyColor.shade50,
    );
  }

  static const Color primaryColor = Color.fromRGBO(44, 49, 54, 1.0);
  static const Color primaryColorLight = Color.fromRGBO(71, 79, 87, 1.0);
  static const Color secondaryColor = Color.fromRGBO(46, 184, 154, 1.0);
  static const Color accentColor = Color.fromRGBO(255, 155, 0, 1.0);

  static const MaterialColor _lightGreyColor = MaterialColor(0xFF959595, {
    50: Color(0xFFFFFFFF), //Scaffold/Page Background.
    100: Color(0xFFF4F4F4),
    200: Color(0xFFEAEAEA),
    300: Color(0xFFD3D3D3),
    400: Color(0xFFBCBCBC),
    500: Color(0xFF959595),
    600: Color(0xFF747474), // Input Background.
    700: Color(0xFF2C2C2C),
    800: Color(0xFF171717),
    900: Color(0xFF000000), // Placeholder.
  });

  static const MaterialColor _darkGreyColor = MaterialColor(0xFFBCBCBC, {
    50: Color(0xFF000000), // Placeholder.
    100: Color(0xFF171717),
    200: Color(0xFF2C2C2C),
    300: Color(0xFF747474), // Input Background.
    400: Color(0xFF959595),
    500: Color(0xFFBCBCBC),
    600: Color(0xFFD3D3D3),
    700: Color(0xFFEAEAEA),

    800: Color(0xFFF4F4F4),
    900: Color(0xFFFFFFFF), //Scaffold/Page Background.
  });

  static const MaterialColor darkCursorColor = MaterialColor(0xFFFFFFFF, {
    50: Color(0xFF000000), // Placeholder.
    100: Color(0xFF171717),
    200: Color(0xFF2C2C2C),
    300: Color(0xFF747474), // Input Background.
    400: Color(0xFF959595),
    500: Color(0xFFBCBCBC),
    600: Color(0xFFD3D3D3),
    700: Color(0xFFEAEAEA),
    800: Color(0xFFF4F4F4),
    900: Color(0xFFFFFFFF), //Scaffold/Page Background.
  });

  static const MaterialColor _darkAccentColor = MaterialColor(0xFF1F7D69, {
    100: Color(0xFFC2F0E6),
    200: Color(0xFFC2F0E6),
    500: Color(0xCB2EB89A),
    600: Color(0xFFEBFAF7),
    700: Color(0xFFEBFAF7),
  });
}
