
class Category {
  String? idCategory;
  String? strCategory;
  String? strCategoryThumb;
  String? strCategoryDescription;

  Category({
   required this.idCategory,
   required this.strCategory,
   required this.strCategoryThumb,
    required this.strCategoryDescription,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      idCategory: json['idCategory'],
      strCategory: json['strCategory'],
      strCategoryThumb: json['strCategoryThumb'],
      strCategoryDescription: json['strCategoryDescription'],
    );
  }
}
