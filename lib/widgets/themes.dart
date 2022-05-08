import 'package:flutter/material.dart';

class MyTheme{
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepPurple,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
        )
      );
}