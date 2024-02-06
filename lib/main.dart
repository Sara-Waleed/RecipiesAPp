import 'package:flutter/material.dart';
import 'package:recipiesapp/screens/Fav_Page.dart';
import 'package:recipiesapp/screens/HomePage.dart';
import 'package:recipiesapp/screens/Meal_details.dart';
import 'screens/Splach.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
   home:SplashScreen(),
    );
  }
}
// Scaffold(
// body: PageView(
// controller: PageController(
// initialPage: _currentIndex,
// ),
// children: _screens,
// onPageChanged: (index) {
// setState(() {
// _currentIndex = index;
// });
// },
// ),
// bottomNavigationBar: BottomNavigationBar(
// currentIndex: _currentIndex,
// onTap: (index) {
// setState(() {
// _currentIndex = index;
// });
// },
// items: [
// BottomNavigationBarItem(
// icon: Icon(Icons.home),
// label: 'Home',
// ),
// BottomNavigationBarItem(
// icon: Icon(Icons.favorite),
// label: 'Favorite',
// ),
// ],
// ),
// ),