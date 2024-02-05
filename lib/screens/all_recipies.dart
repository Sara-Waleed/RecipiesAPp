import '../models/all_meals_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Api/all_meals_request.dart';


class MealListScreen extends StatefulWidget {
  final String? selectedCategory;
  final String? categoryImage;

  MealListScreen({Key? key, this.selectedCategory,  required this.categoryImage,}) : super(key: key);

  @override
  _MealListScreenState createState() => _MealListScreenState();
}

class _MealListScreenState extends State<MealListScreen> {
  late Future<List<Meal>> futureMeals;

  @override
  void initState() {
    super.initState();
    futureMeals = fetchMealsByCategory(widget.selectedCategory ?? "Beef");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: FutureBuilder<List<Meal>>(
        future: futureMeals,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No meals found'));
          } else {
            return Column(
              children: [
              Container(
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(widget.categoryImage!),
                ),
              ),
              child: Stack(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  Positioned(
                    bottom: 8.0,
                    left: 8.0,
                    child: Text(
                      widget.selectedCategory!,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],);

          }
        },
      ),
    );
  }
}

class MealItemWidget extends StatelessWidget {
  final Meal meal;

  MealItemWidget({required this.meal});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Stack(
        children: [
          Container(
            height: 200.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(meal.strMealThumb!),
              ),
            ),
          ),
          Container(
            height: 200.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          Positioned(
            bottom: 8.0,
            left: 8.0,
            child: Text(
              meal.strMeal!,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
