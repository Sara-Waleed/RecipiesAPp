import 'package:flutter/material.dart';
import 'package:recipiesapp/models/all_meals_model.dart';

class Meal_Details extends StatefulWidget {
//  final Meal meal;

  Meal_Details({Key? key}) : super(key: key);
  //this.meal,
  @override
  State<Meal_Details> createState() => _Meal_DetailsState();
}

class _Meal_DetailsState extends State<Meal_Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 450,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
               child:Image.asset("assets/lindsay-cotter-9J7sHieVFi0-unsplash.jpg",
               //Image.network(
              // // "https:${widget.meal.strMealThumb}",
              //
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),


          Column(
            children: [
              Row(
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
                          "cakes",
                          style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,

                        ),),
                      )),
                  IconButton(onPressed: (){},
                      icon: Icon(Icons.favorite_border)),
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
              SizedBox(height: 50,),
              Container(
                alignment: Alignment.bottomCenter,
                height: 70,
                width: 350,
                child: Center(child: Text("Add To Card",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),)),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),

                ),

              ),
            ],
          )
        ],
      ),
    );
  }
}
