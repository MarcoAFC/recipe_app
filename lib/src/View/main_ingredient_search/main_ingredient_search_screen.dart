import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mvc_recipe/src/Controllers/main_ingredient_search_screen/main_ingredient_controller.dart';
import 'package:mvc_recipe/src/Models/networking/providers/meals/interface_recipe_provider.dart';
import 'package:mvc_recipe/src/Models/recipe_list/recipe_list.dart';
import 'package:mvc_recipe/src/View/main_screen/widgets/recipe_card.dart';
import 'package:mvc_recipe/src/View/main_screen/widgets/search_bar.dart';
import 'package:mvc_recipe/src/utils/string_utils.dart';

class MainIngredientSearchScreen extends StatefulWidget {
  @override
  _MainIngredientSearchScreenState createState() => _MainIngredientSearchScreenState();
}

class _MainIngredientSearchScreenState extends State<MainIngredientSearchScreen> {
  final controller = MainIngredientController(GetIt.I.get<IRecipeProvider>());

  Future<RecipeList> recipeList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(StringUtil.MAIN_INGREDIENT_APPBAR_TITLE),
            centerTitle: true, 
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Column(
                  children: [
                    SearchBar(
                      focus: true,
                      onSubmitted: (query){
                        setState(() {
                          recipeList = controller.getRecipesByIngredient(query);
                        });
                      },
                    ),
                    FutureBuilder<RecipeList>(
                      future: recipeList,
                      builder: (context, snapshot){
                        if(snapshot.connectionState == ConnectionState.waiting){
                          return Center(child: CircularProgressIndicator(),);
                        }
                        else if(snapshot.data != null? snapshot.data.recipes.isEmpty : false){
                          return Center(child: Text("No recipes found"),);
                        }
                        else if(snapshot.hasData || snapshot.data != null){
                          List<Widget> children = List.generate(
                            snapshot.data.recipes.length, (index) => 
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 12.0),
                              child: RecipeCard(
                                key: ValueKey("mainIngredient" + index.toString()),
                                recipe: snapshot.data.recipes[index],
                              ),
                            )
                          );
                          return Column(
                            children: children
                          );
                        }
                        else{
                          return Container();
                        }
                      },
                    )
                  ],
                );
              },
              childCount: 1,

            )
          )
        ] 
      )
    );
  }
}