import 'package:flutter/material.dart';
import 'package:food_delivery/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[50],
          primaryColor: Colors.deepOrangeAccent,
          primaryIconTheme:
              const IconThemeData(color: Colors.deepOrangeAccent)),
      home: const HomeScreen(),
    );
  }
}
