import 'package:mvc_recipe/src/Models/networking/providers/meals/interface_recipe_provider.dart';
import 'package:mvc_recipe/src/Models/recipe_list/recipe_list.dart';

class MainIngredientController{
  final IRecipeProvider provider;

  MainIngredientController(this.provider);

  Future<RecipeList> getRecipesByIngredient(String query) async {
    var recipes = await provider.getMealsByMainIngredient(query);
    return recipes;
  }
}