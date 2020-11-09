import 'package:flutter/material.dart';

import 'package:mvc_recipe/src/Models/recipe/recipe_model.dart';
import 'package:mvc_recipe/src/View/recipe_screen/widgets/recipe_body.dart';
import 'package:mvc_recipe/src/View/recipe_screen/widgets/recipe_box.dart';
import 'package:mvc_recipe/src/View/recipe_screen/widgets/recipe_ingredients.dart';

class RecipeScreen extends StatelessWidget {
  final RecipeModel recipe;
  const RecipeScreen({
    Key key,
    @required this.recipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Container(
        color: Theme.of(context).accentColor.withAlpha(50),
        height: MediaQuery.of(context).size.height*0.8,
        width: MediaQuery.of(context).size.width*0.8,
        child: Column(
          children: [
            RecipeBox(recipe: recipe),
            RecipeIngredient(ingredientList: recipe.ingredientList,),
            RecipeBody(instructionString: recipe.instructions)
          ]
        ),
      ),
    );
  }
}
