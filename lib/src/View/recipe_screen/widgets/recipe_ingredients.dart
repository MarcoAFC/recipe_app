import 'package:flutter/material.dart';
import 'package:mvc_recipe/src/Controllers/recipe_screen/widgets/recipe_ingredients_controller.dart';

class RecipeIngredient extends StatelessWidget {
  final List<String> ingredientList;

  const RecipeIngredient({@required this.ingredientList});
  @override
  Widget build(BuildContext context) {
    var controller = RecipeIngredientController(ingredientList);
    return Container(
      constraints: BoxConstraints(
        maxHeight: controller.ingredientList.length > 8 ?
         (MediaQuery.of(context).size.height*0.018)*((controller.ingredientList.length)) :
         (MediaQuery.of(context).size.height*0.13)*controller.ingredientList.length/7
         ,
        minHeight: (MediaQuery.of(context).size.height*0.05)
      ),
      color: Theme.of(context).accentColor.withAlpha(20),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: controller.ingredientList.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: MediaQuery.of(context).size.width*0.4,
          childAspectRatio: 8
        ),
        padding: EdgeInsets.only(left: 10.0, top: 20.0),
        itemBuilder: (context, index){
          return Container(
            constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height*0.05),
            child: Text("• ${controller.ingredientList[index]}"));
        }),
    );
  }
}