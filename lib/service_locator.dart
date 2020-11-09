import 'package:get_it/get_it.dart';
import 'package:mvc_recipe/src/Models/networking/providers/meals/interface_recipe_provider.dart';
import 'package:mvc_recipe/src/Models/networking/providers/meals/recipe_provider.dart';
import 'package:mvc_recipe/src/Models/networking/providers/region/interface_region_provider.dart';
import 'package:mvc_recipe/src/Models/networking/providers/region/region_provider.dart';

setupServiceLocators(){
  final GetIt getIt = GetIt.I;
  getIt.registerLazySingleton<IRecipeProvider>(() => RecipeProvider());
  getIt.registerLazySingleton<IRegionProvider>(() => RegionProvider());
}