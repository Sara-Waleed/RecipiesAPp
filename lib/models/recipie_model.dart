class Recipe {
  final String id;
  final String title;
  final List<String> ingredients;
  final String instructions;
  final String image;

  Recipe({
    required this.id,
    required this.title,
    required this.ingredients,
    required this.instructions,
    required this.image,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'].toString(),
      title: json['Title'] ?? '',
      ingredients: (json['Ingredients'] as Map<String, dynamic>?)
          ?.values
          ?.map((ingredient) => ingredient.toString())
          ?.toList() ?? [],
      instructions: json['Instructions'] ?? '',
      image: _validateImageUrl(json['Image'] ?? ''),
    );
  }
  static String _validateImageUrl(String imageUrl) {
    // Add your own validation logic here, e.g., checking for a valid URL format
    return imageUrl;
  }
}





