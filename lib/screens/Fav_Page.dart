import 'package:flutter/material.dart';
import '../models/all_meals_model.dart';
import '../models/fav_list.dart';
import 'HomePage.dart';



class FavList extends StatefulWidget {
  final List<Meal> favoriteMeals;

  FavList({Key? key, required this.favoriteMeals}) : super(key: key);

  @override
  State<FavList> createState() => _FavListState();
}

class _FavListState extends State<FavList> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("Your Meals"),
      ),
      body: Column(
        children: [

          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                Meal meal = widget.favoriteMeals[index];
                return ListTile(
                  title: Text(meal.strMeal ?? ''),
                );
              },
              separatorBuilder: (context, index) => Divider(),
              itemCount: widget.favoriteMeals.length,
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            if (index == 0) {
              Navigator.pop(context);
            }
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
        ],
      ),

    );
  }
}
