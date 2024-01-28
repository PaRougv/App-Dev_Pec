import "package:dialing_app/call.dart";
import "package:dialing_app/utils/routes.dart";
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
      home: callInFlutter(),
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
        MyRoutes.callRoute:(context)=>callInFlutter(),
        // MyRoutes.callRoute: (context) => callInFlutter(),
        // MyRoutes.loginRoute: (context) => LoginPage(),

      },
    );
  }
}
