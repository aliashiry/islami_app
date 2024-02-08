import 'package:flutter/material.dart';

class MyTheme {
  // colors - light - dark
  static Color blackColor = Color(0xff242424);
  static Color WhiteColor = Color(0xffffffff);
  static Color yellowColor = Color(0xffFACC1D);
  static Color primaryLight = const Color(0xffB7935F);
  static Color primeryDark = const Color(0xff141A2E);
  static ThemeData lightMode = ThemeData(
    primaryColor: primaryLight,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      titleMedium: TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      titleSmall: TextStyle(
        fontSize: 24,
        //fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: blackColor,
        //showUnselectedLabels: true,
        backgroundColor: primaryLight),
  );
  static ThemeData darkMode = ThemeData(
    primaryColor: primeryDark,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: MyTheme.WhiteColor)),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: MyTheme.WhiteColor,
      ),
      titleMedium: TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.w400,
        color: MyTheme.WhiteColor,
      ),
      titleSmall: TextStyle(
        fontSize: 24,
        //fontWeight: FontWeight.bold,
        color: MyTheme.WhiteColor,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: yellowColor,
    ),
  );
}
