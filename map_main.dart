import 'package:flutter/material.dart';
import 'package:saurakshan_maps/screens/polygone.dart';
// import 'package:googlemap/home_screen.dart';
// import 'package:google_maps/home_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
        // useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
