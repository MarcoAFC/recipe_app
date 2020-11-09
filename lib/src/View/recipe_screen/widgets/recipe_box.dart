import 'package:flutter/material.dart';
import 'package:mvc_recipe/src/Models/recipe/recipe_model.dart';

class RecipeBox extends StatelessWidget {
  final RecipeModel recipe;

  const RecipeBox({Key key, @required this.recipe}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
          recipe.mealThumb, 
          height: MediaQuery.of(context).size.height*0.15, 
          width: MediaQuery.of(context).size.height*0.15,
          cacheHeight: (MediaQuery.of(context).size.height*0.15).ceil(), 
          cacheWidth: (MediaQuery.of(context).size.height*0.15).ceil(),
        ),
        Expanded(
          child: Container(
            constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height*0.15),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).accentColor.withAlpha(50),
                  Theme.of(context).accentColor.withAlpha(100)
                ]
              )
            ),
            child: ListTile(
              key: ValueKey("BoxTile"),
              contentPadding: EdgeInsets.only(top: 20.0, left: 8.0),
              title: Text(recipe.meal),
              subtitle: Text("• ${recipe.category}\n• ${recipe.area}"),
              onLongPress: () {
                Navigator.of(context).pop();
              },       
            ),
          ),
        )
      ],
    );

  }
}