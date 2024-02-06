import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/catregories_model.dart';
import '../screens/all_recipies.dart';

class CategoryItemWidget extends StatelessWidget {
  final Category meal;

  CategoryItemWidget({required this.meal});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => MealListScreen(
            selectedCategory: meal.strCategory,
            categoryImage: meal.strCategoryThumb,),));
        },
        child: Stack(
          children: [
            Container(
              height: 190.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(meal.strCategoryThumb!),
                ),
              ),
            ),
            Container(
              height: 200.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0), //color: Colors.black.withOpacity(0.5),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 150,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      meal.strCategory!,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
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