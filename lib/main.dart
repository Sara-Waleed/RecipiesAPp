import 'package:flutter/material.dart';
import 'package:recipiesapp/screens/Meal_details.dart';
import 'screens/Splach.dart';

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
   home: Meal_Details(),
    );
  }
}
