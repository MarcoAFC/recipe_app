import 'package:mvc_recipe/src/Models/networking/providers/meals/interface_recipe_provider.dart';
import 'package:mvc_recipe/src/Models/recipe/recipe_model.dart';
import 'package:mvc_recipe/src/Models/recipe_list/recipe_list.dart';
import 'package:rxdart/rxdart.dart';

class MainController{
  BehaviorSubject<RecipeList> randomMealStream = BehaviorSubject();
  final IRecipeProvider _provider;

  MainController(this._provider);
  
  startController(int maxNumber) async{
    List<RecipeModel> recipes = List();
    for(var i = 0; i < maxNumber; i++){
      recipes.add(await _provider.getRandomMeal());
    }
    randomMealStream.add(RecipeList(recipes));
  }

  dispose(){
    randomMealStream.close();
  }

  Future<RecipeModel> getRandomMeal(){
    return _provider.getRandomMeal();
  }
}