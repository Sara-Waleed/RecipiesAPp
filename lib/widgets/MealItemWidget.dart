import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipiesapp/screens/Meal_details.dart';

import '../models/all_meals_model.dart';

class MealItemWidget extends StatelessWidget {
  final Meal meal;
  MealItemWidget({required this.meal} );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
         return Meal_Details(meal);
        },));
      },
      child: Container(
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
         // //   Container(
         //      height: 200.0,
         //      decoration: BoxDecoration(
         //        borderRadius: BorderRadius.circular(8.0),
         //        color: Colors.black,
         //      ),
           // ),
            Positioned(
              bottom: 1.0,
              left: 1.0,
              child: Container(
                width: 180.0, // Adjust as needed
                child: Container(
                  decoration: BoxDecoration(
                    color: CupertinoColors.inactiveGray.withOpacity(0.5),
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(10)),
                  ),
                  width: double.infinity,

                  child: Text(
                    meal.strMeal!,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    maxLines: 4, // Ensure the text wraps to the second line if needed
                    overflow: TextOverflow.ellipsis, // Display ellipsis if text overflows
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
