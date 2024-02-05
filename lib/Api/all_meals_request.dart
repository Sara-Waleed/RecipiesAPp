import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/all_meals_model.dart';

Future<List<Meal>> fetchMealsByCategory(String category) async {
  final apiUrl = 'https://www.themealdb.com/api/json/v1/1/filter.php?c=$category';

  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    final List<dynamic> mealsJson = json.decode(response.body)['meals'];
    return mealsJson.map((json) => Meal.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load meals');
  }
}