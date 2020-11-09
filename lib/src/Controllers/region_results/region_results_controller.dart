import 'package:mvc_recipe/src/Models/networking/providers/meals/interface_recipe_provider.dart';
import 'package:mvc_recipe/src/Models/recipe_list/recipe_list.dart';

class RegionResultsController{
  final IRecipeProvider provider;

  RegionResultsController(this.provider);

  Future<RecipeList> getRegionalRecipes(String area){
    return provider.getMealsByRegion(area); 
  }
}