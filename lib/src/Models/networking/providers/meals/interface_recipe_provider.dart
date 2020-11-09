import 'package:mvc_recipe/src/Models/recipe/recipe_model.dart';
import 'package:mvc_recipe/src/Models/recipe_list/recipe_list.dart';

abstract class IRecipeProvider{
  IRecipeProvider({String apiKey});
  Future<RecipeList> getRecipeByName(String name);
  Future<RecipeList> getRecipeByFirstLetter(String firstLetter);
  Future<RecipeModel> getRecipeByID(String id);
  Future<RecipeModel> getRandomMeal();
  Future<RecipeList> getMealsByMainIngredient(String ingredient);
  Future<RecipeList> getMealsByRegion(String region);
}