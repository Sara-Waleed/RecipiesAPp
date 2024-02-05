import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/catregories_model.dart';



  Future<List<Category>> fetchCategories() async {
    final String apiUrl = 'https://www.themealdb.com/api/json/v1/1/categories.php';
    final response = await http.get(
      Uri.parse(apiUrl)
    );

    if (response.statusCode == 200) {
      List<dynamic> categoriesJson = json.decode(response.body)['categories'];
      return categoriesJson.map((json) => Category.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }


