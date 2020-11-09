import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mvc_recipe/src/Controllers/main_screen/main_screen_controller.dart';
import 'package:mvc_recipe/src/Models/networking/providers/interface_recipe_provider.dart';
import 'package:mvc_recipe/src/Models/recipe/recipe_model.dart';
import 'package:mvc_recipe/src/Models/recipe_list/recipe_list.dart';
import 'package:mvc_recipe/src/View/main_screen/widgets/button_from_svg.dart';
import 'package:mvc_recipe/src/View/main_screen/widgets/recipe_card.dart';
import 'package:mvc_recipe/src/View/main_screen/widgets/search_bar.dart';
import 'package:mvc_recipe/src/View/recipe_screen/recipe_screen.dart';
import 'package:mvc_recipe/src/utils/string_utils.dart';
import 'package:shimmer/shimmer.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  MainController controller = MainController(GetIt.I.get<IRecipeProvider>());

  @override
  void initState() {
    super.initState();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    controller.startController((MediaQuery.of(context).size.height/120).floor());

  }
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text(StringUtil.APPBAR_TITLE),
          centerTitle: true,  
        ),
        SliverList(delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Column(
              children: [
                SearchBar(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ButtonFromSvg(
                      onTap: (){
                        Navigator.of(context).pushNamed("/mainIngredient");
                      }, 
                      svgPath: "icons/ingredients_outline2.svg", 
                      iconSize: 60, 
                      splashSize: 80,
                      key: ValueKey("IngredientIcon"),
                      label: StringUtil.INGREDIENTS_LABEL,
                    ),
                    ButtonFromSvg(
                      onTap: (){}, 
                      svgPath: "icons/world.svg", 
                      iconSize: 60, 
                      splashSize: 80,
                      key: ValueKey("WorldIcon"),
                      label: StringUtil.WORLD_LABEL,
                    ),
                    ButtonFromSvg(
                      onTap: () async {
                        final recipe = Future.delayed(Duration(milliseconds: 1000), () => controller.getRandomMeal());
                        showDialog(
                          context: context, 
                          builder: (context) => 
                          FutureBuilder<RecipeModel>(
                            future: recipe,
                            builder: (context, snapshot){
                              if(snapshot.connectionState == ConnectionState.active || snapshot.connectionState == ConnectionState.done){
                                return RecipeScreen(
                                  key: ValueKey("RandomRecipe"), 
                                  recipe: snapshot.data
                                );
                              }else{
                                return Center(
                                  child: CircularProgressIndicator(
                                    key: ValueKey("LoadingIndicator"),
                                  ),
                                );
                              }
                            }
                          ),
                        );
                      }, 
                      svgPath: "icons/shuffle.svg", 
                      iconSize: 60, 
                      splashSize: 80,
                      key: ValueKey("ShuffleIcon"),
                      label: StringUtil.RANDOM_LABEL,
                    ),
                  ],
                ),
                StreamBuilder<RecipeList>(
                  stream: controller.randomMealStream,
                  builder: (_, snapshot){
                    if((snapshot.connectionState == ConnectionState.done || snapshot.connectionState == ConnectionState.active)){
                      List<Widget> children = List.generate(
                        snapshot.data.recipes.length, (index) => 
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          child: RecipeCard(
                            key: ValueKey(index),
                            recipe: snapshot.data.recipes[index],
                          ),
                        )
                      );
                      return Column(
                        children: children
                      );
                    }
                    else{
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width *0.8,
                          height: 75,
                          decoration: BoxDecoration(
                            border: Border.fromBorderSide(BorderSide(style: BorderStyle.solid, color: Colors.black54)),
                            borderRadius: BorderRadius.circular(8.0),
                            color: Theme.of(context).accentColor.withAlpha(100)
                          ),
                          child: Shimmer.fromColors(
                            key: ValueKey("ShimmerLoading"),
                            highlightColor: Theme.of(context).accentColor.withAlpha(100),
                            baseColor: Colors.grey[400],
                            child: ListTile(
                              leading: Container(height: 80, width: 60, color: Colors.black,),
                              title: Container(height: 10, width: 80, color: Colors.black,),
                              subtitle: Container(height: 10, width: 60, color: Colors.black,),
                            )
                          ),
                        ),
                      );
                    }
                  }
                )
              ],
            );
          },
          childCount: 1
        ))
      ],
    );
  }
}