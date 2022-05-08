import 'package:flutter/material.dart';
import 'package:vitals_ai/screens/home.dart';
import 'package:vitals_ai/utils/routes.dart';
import 'package:vitals_ai/widgets/themes.dart';
import 'screens/home.dart';
import 'screens/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: ThemeData(
        brightness: Brightness.dark
      ),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
      },
    );
  }
}   