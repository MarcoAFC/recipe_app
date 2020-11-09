import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mvc_recipe/src/Controllers/region_results/region_results_controller.dart';
import 'package:mvc_recipe/src/Models/networking/providers/meals/interface_recipe_provider.dart';
import 'package:mvc_recipe/src/Models/recipe_list/recipe_list.dart';
import 'package:mvc_recipe/src/Models/region/region_model.dart';
import 'package:mvc_recipe/src/View/main_screen/widgets/recipe_card.dart';

class RegionResultScreen extends StatelessWidget {
  final RegionModel region;
  final RegionResultsController controller = RegionResultsController(GetIt.I.get<IRecipeProvider>());
  RegionResultScreen({Key key, this.region}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Future<RecipeList> recipeList = controller.getRegionalRecipes(region.area);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(region.area),
            centerTitle: true, 
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return FutureBuilder<RecipeList>(
                  future: recipeList,
                  builder: (_, snapshot){
                    if(snapshot.hasData){
                      var children = List.generate(
                        snapshot.data.recipes.length, 
                        (index) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          child: RecipeCard(recipe: snapshot.data.recipes[index]),
                        ));
                      return Column(
                        children: children
                      );
                    }
                    else{
                      return Center(child: CircularProgressIndicator(),);
                    }
                  }
                );
              },
              childCount: 1
            )
          )
        ]
      )
    );
  }
}