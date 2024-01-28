import 'package:classico/pages/login_page.dart';
import 'package:classico/pages/new_page.dart';
import 'package:classico/utils/routes.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily,
        // primaryTextTheme: GoogleFonts.latoTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      // initialRoute: "/Home",
      routes: {
        // "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => NewPage(),
        MyRoutes.loginRoute: (context) => LoginPage(),

      },
    );
  }
}

