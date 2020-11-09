import 'package:dio/dio.dart';
import 'package:mvc_recipe/src/Models/networking/providers/interface_recipe_provider.dart';
import 'package:mvc_recipe/src/Models/recipe_list/recipe_list.dart';
import 'package:mvc_recipe/src/Models/recipe/recipe_model.dart';

class RecipeProvider implements IRecipeProvider{
  Dio dio;

  RecipeProvider({String apiKey = "1"}){
    dio = Dio(BaseOptions(
      baseUrl: "https://www.themealdb.com/api/json/v1/$apiKey",
    ));
  }

  @override
  Future<RecipeList> getRecipeByName(String name)async {
    var response = await dio.get("/search.php?s=$name");
    if(response.statusCode != 200){
      throw Exception("Request error: ${response.statusCode} - ${response.statusMessage}");
    }
    return RecipeList.fromJson(response.data);
  }

  @override
  Future<RecipeList> getMealsByMainIngredient(String ingredient) async {
    var response = await dio.get("/filter.php?i=$ingredient");
    if(response.statusCode != 200){
      throw Exception("Request error: ${response.statusCode} - ${response.statusMessage}");
    }
    var recipes;
    if(response.data['meals'] != null){
     recipes = RecipeList.fromJson(response.data);
    }
    var completeRecipes = List<RecipeModel>();
    if(recipes != null){
      for(var id in recipes?.recipes){
        var recipe = await getRecipeByID(id.idMeal);
        completeRecipes.add(recipe);
        print(recipe.meal);
      }
    }
    return RecipeList(completeRecipes);
  }

  @override
  Future<RecipeList> getMealsByRegion(String region) async {
    var response = await dio.get("/filter.php?a=$region");
    if(response.statusCode != 200){
      throw Exception("Request error: ${response.statusCode} - ${response.statusMessage}");
    }
    return RecipeList.fromJson(response.data);
  }

  @override
  Future<RecipeModel> getRandomMeal() async {
    var response = await dio.get("/random.php");
    if(response.statusCode != 200){
      throw Exception("Request error: ${response.statusCode} - ${response.statusMessage}");
    }
    return RecipeModel.fromJson(response.data['meals'][0]);
  }

  @override
  Future<RecipeList> getRecipeByFirstLetter(String firstLetter) async {
    var response = await dio.get("/search.php?f=$firstLetter");
    if(response.statusCode != 200){
      throw Exception("Request error: ${response.statusCode} - ${response.statusMessage}");
    }
    return RecipeList.fromJson(response.data);
  }

  @override
  Future<RecipeModel> getRecipeByID(String id) async {
    var response = await dio.get("/lookup.php?i=$id");
    if(response.statusCode != 200){
      throw Exception("Request error: ${response.statusCode} - ${response.statusMessage}");
    }
    return RecipeModel.fromJson(response.data['meals'][0]);
  }
  
}