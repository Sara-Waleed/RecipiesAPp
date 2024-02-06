import '../widgets/CustomSearchBar.dart';
import '../models/catregories_model.dart';
import 'package:flutter/material.dart';
import '../Api/categories_request.dart';
import '../widgets/CategoryItemWidget.dart';





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
        title: Text('Your Recipies',style:TextStyle(
          fontFamily: "ProtestRevolution",
        ),),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Hi Sara",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("What Would you like to order? ",style: TextStyle(color: Colors.white,fontSize: 15),)),
                ),

                Container(
                  height: 65,
                  child: CustomSearchBar(),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          FutureBuilder<List<Category>>(
            future:categories,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator(color: Colors.yellow),);
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Text('No recipes found');
              } else {
                return Expanded(
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
                );

              }
            },
          ),
        ],
      ),
    );

  }

}

