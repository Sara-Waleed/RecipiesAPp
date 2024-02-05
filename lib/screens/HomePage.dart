import '../models/catregories_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Api/categories_request.dart';
import 'all_recipies.dart';



class RecipeListScreen extends StatefulWidget {

  @override
  _RecipeListScreenState createState() => _RecipeListScreenState();

}


class _RecipeListScreenState extends State<RecipeListScreen> {

  late  Future<List<Category>> categories;
  @override
  void initState() {
    super.initState();
    categories= fetchCategories();// You can change the category here
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.grey,
        title: Text('Your Recipies',style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: FutureBuilder<List<Category>>(
        future:categories,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(color: Colors.yellow),);
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Text('No recipes found');
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Hi Sara",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("What Would you like to order? ",style: TextStyle(color: Colors.white,fontSize: 15),),
                  ),

                  Container(
                    height: 65,
                  child: CustomSearchBar(),
                  ),
              Expanded(
              child: Padding(

                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                Category meal = snapshot.data![index];
                return CategoryItemWidget(meal: meal);
                },
                ),
              ),
              ),
                ],
              ),
            );

          }
        },
      ),
    );

  }

}
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
class CustomSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey,
          prefixIcon: IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle search icon press
              // You can implement search functionality here
            },
          ),
          hintText: 'Search...',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onChanged: (value) {
          // Handle changes in the search text
          // You can use the 'value' for search suggestions or filtering
        },
      ),
    );
  }
}