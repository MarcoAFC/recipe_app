import 'package:flutter/material.dart';

import 'package:mvc_recipe/src/Models/recipe/recipe_model.dart';

class RecipeScreen extends StatelessWidget {
  final RecipeModel recipe;
  const RecipeScreen({
    Key key,
    this.recipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        height: MediaQuery.of(context).size.height*0.8,
        width: MediaQuery.of(context).size.width*0.8,
        child: Container(
          color: Colors.grey[200],
          height: MediaQuery.of(context).size.height*0.7,
          width: MediaQuery.of(context).size.width*0.7,
        ),
      ),
    );
  }
}
