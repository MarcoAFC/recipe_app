class RecipeModel{
  final String idMeal;
  final String meal;
  final String drinkAlternate;
  final String category;
  final String area;
  final String instructions;
  final String mealThumb;
  final String tags;
  final String youtube;
  final String dateModified;
  final List<String> ingredientList;
  final List<String> measurementList;

  RecipeModel(
    this.idMeal, 
    this.meal, 
    this.drinkAlternate, 
    this.category, 
    this.area, 
    this.instructions, 
    this.mealThumb, 
    this.tags, 
    this.youtube, 
    this.dateModified, 
    this.ingredientList, 
    this.measurementList);

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    List<String> ingredientList = List(20);
    List<String> measurementList = List(20);
    for(var i = 0; i < 20; i++){
      if(json['strIngredient$i'] != null && json['strIngredient$i'].toString().isNotEmpty){
        ingredientList[i] = json['strIngredient$i'];
        measurementList[i] = json['strMeasure$i'];
      }
    }
    return RecipeModel(
      json['idMeal'], 
      json['strMeal'], 
      json['strDrinkAlternate'], 
      json['strCategory'], 
      json['strArea'], 
      json['strInstructions'], 
      json['strMealThumb'], 
      json['strTags'], 
      json['strYoutube'], 
      json['dateModified'], 
      ingredientList,
      measurementList);
  }

  Map<String, dynamic> toJson(){
    Map<String, dynamic> json = Map();
    json['idMeal'] = this.idMeal;
    json['strMeal'] = this.meal;
    json['strDrinkAlternate'] = this.drinkAlternate;
    json['strCategory'] = this.category;
    json['strArea'] = this.area;
    json['strInstructions'] = this.instructions;
    json['strMealThumb'] = this.mealThumb;
    json['strTags'] = this.tags;
    json['strYoutube'] = this.youtube;
    json['dateModified'] = this.dateModified;
    return json;
  }
}