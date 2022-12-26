import 'package:flutter/material.dart';

class appTheme {
  static ThemeData get theme {
    return ThemeData(
        colorScheme: const ColorScheme(
            brightness: Brightness.dark,
            primary: Color(0xff5C4964),
            onPrimary: Color(0xffFAFAFA),
            secondary: Color(0xffAE3B40),
            onSecondary: Color(0xffFAFAFA),
            tertiary: Color(0xffAE3B40),
            error: Color(0xff725252),
            onError: Color(0xff725252),
            background: Color(0xff090909),
            onBackground: Color(0xff090909),
            surface: Color(0xff1B1B1B),
            onSurface: Color(0xffFAFAFA),
            outline: Color(0xff505050)),
        hintColor: Color(0xff4B4B4B),
        dividerColor: const Color(0xff323232),
        dividerTheme:
            const DividerThemeData(thickness: 2, indent: 10, endIndent: 10),
        appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xff1B1B1B),
            elevation: 0,
            centerTitle: true,
            titleTextStyle: TextStyle(fontSize: 26, color: Color(0xffFAFAFA))),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Color(0xff090909),
            selectedItemColor: Color(0xffFAFAFA),
            unselectedItemColor: Color(0xff4B4B4B),
            showSelectedLabels: false,
            showUnselectedLabels: false),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0))),
                backgroundColor:
                    MaterialStateProperty.all(const Color(0xff5C4964)),
                foregroundColor:
                    MaterialStateProperty.all(const Color(0xffFAFAFA)))),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Color(0xffAE3B40)),
        inputDecorationTheme: InputDecorationTheme(
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: 2, color: Color(0xff5C4964))),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: 2, color: Color(0xff323232)))));
  }
}
