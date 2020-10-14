import 'package:get_it/get_it.dart';
import 'package:mvc_recipe/src/Models/networking/providers/interface_recipe_provider.dart';
import 'package:mvc_recipe/src/Models/networking/providers/recipe_provider.dart';

setupServiceLocators(){
  final GetIt getIt = GetIt.I;
  getIt.registerLazySingleton<IRecipeProvider>(() => RecipeProvider());
}