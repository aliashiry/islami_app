import 'package:flutter/material.dart';

class MyTheme {
  // colors - light - dark
  static Color blackColor =  Color(0xff242424);
  static Color WhiteColor =  Color(0xffffffff);
  static Color primaryLight = const Color(0xffB7935F);
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
          fontSize: 25,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        titleSmall: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      bottomNavigationBarTheme:
          BottomNavigationBarThemeData(
            selectedItemColor: blackColor,
              //showUnselectedLabels: true,
              backgroundColor: primaryLight),

  );
}
