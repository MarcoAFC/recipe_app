import 'package:mvc_recipe/src/Models/recipe/recipe_model.dart';

class RecipeList{
  final List<RecipeModel> recipes;

  RecipeList(this.recipes);

  factory RecipeList.fromJson(Map<String, dynamic> json){
    List<RecipeModel> recipes = List();
    json['meals'].forEach((meal){
      recipes.add(RecipeModel.fromJson(meal));
    });
    return RecipeList(recipes);
  }
}