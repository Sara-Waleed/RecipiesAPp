import 'package:flutter/material.dart';
import 'package:recipiesapp/models/all_meals_model.dart';

import '../models/fav_list.dart';

class Meal_Details extends StatefulWidget {
 final Meal meal;

  Meal_Details(this.meal,{Key? key}) : super(key: key);


  @override
  State<Meal_Details> createState() => _Meal_DetailsState();
}

class _Meal_DetailsState extends State<Meal_Details> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Stack(
            children:[ Container(
              height: 450,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                 child:
                 Image.network(
                "${widget.meal.strMealThumb}",

                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
            ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon: Icon(Icons.arrow_back_ios_outlined,color: Colors.white,)),
              ),
      ],
          ),


          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          width: 250,
                          child: Text(
                            maxLines: 4,
                            "${widget.meal.strMeal}",
                            style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,


                          ),),
                        ),
                      )),
                  Expanded(
                    child: IconButton(onPressed: (){
                    setState(() {
                      isFavorite = !isFavorite;
                      if (isFavorite) {
                        GlobalData.favoriteMeals.add(widget.meal);
                      } else {
                        GlobalData.favoriteMeals.remove(widget.meal);
                      }
                    });
                    },
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: Colors.red,
                        )),
                  ),
                ],
              ),

              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(right: 15.0,left: 15,),
                child: Text("description : There is suger and many sugary things inside "
                    "ie t , it has a greate pricthings inside ie t ,"
                    " it has a greate pricthings inside ie t , it has a greate pricit has a greate pricit has "
                    "a greate pricit has a greate pricit has a greate pricit has a greate pric "),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade100,
                      border: Border.all(color: Colors.grey),
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                maxLines: 4,
                                // "${widget.meal.strMeal}",
                                //
                                "125\$",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,

                                ),),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(right: 18.0),
                          child: GestureDetector(
                            onTap: () {
                              // Show a dialog or message when the "Order Now" button is tapped
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Order Confirmation"),
                                    content: Text("Your order has been placed."),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("OK"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              height: 50,
                              width: 150,
                              child: Center(
                                child: Text(
                                  "Order Now",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
