import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mvc_recipe/src/Models/recipe/recipe_model.dart';
import 'package:mvc_recipe/src/View/recipe_screen/recipe_screen.dart';

class RecipeCard extends StatelessWidget {
  final RecipeModel recipe;

  const RecipeCard({Key key, @required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Overlay.of(context).insert(
          OverlayEntry(builder: (_) => RecipeScreen())
        );
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        width: MediaQuery.of(context).size.width *0.8,
        height: 75,
        decoration: BoxDecoration(
          border: Border.fromBorderSide(BorderSide(style: BorderStyle.solid, color: Colors.black54)),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(children: [
          Container(
            padding: EdgeInsets.only(left: 5.0),
            color: Theme.of(context).accentColor.withAlpha(100),
            child: chooseIcon(
              75, 
              MediaQuery.of(context).size.width*0.1
            )
          ),
          Expanded(
            child: Container(
              constraints: BoxConstraints(minHeight: 75),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).accentColor.withAlpha(100),
                    Theme.of(context).accentColor
                  ]
                )
              ),
              child: ListTile(
                contentPadding: EdgeInsets.only(left: 15.0),
                title: Text(recipe.meal),
                subtitle: Text("• ${recipe.category}\n• ${recipe.area}"),
              ),
            ),
          )
        ],),
      ),
    );
  }

  SvgPicture chooseIcon(double height, double width){
    final tags = recipe?.tags?.split(",")?? [];
    if(tags.contains("Cake") || tags.contains("Bun") || tags.contains("Pie")){
      return SvgPicture.asset("icons/baked.svg", height: height, width: width,);
    }
    else if(tags.contains("Fish") || tags.contains("Seafood")){
      return SvgPicture.asset("icons/fish.svg", height: height, width: width);
    }
    else if(tags.contains("Noodles") || tags.contains("Soup") || tags.contains("Pasta")){
      return SvgPicture.asset("icons/noodles.svg", height: height, width: width);
    }
    else if(tags.contains("Desert") || tags.contains("Sweets") || tags.contains("Pudding")){
      return SvgPicture.asset("icons/sweets.svg", height: height, width: width);
    }
    else if(tags.contains("Meat") || tags.contains("BBQ") || tags.contains("Chicken")){
      return SvgPicture.asset("icons/meat.svg", height: height, width: width);
    }
    else if(tags.contains("Breakfast") || tags.contains("Brunch")){
      return SvgPicture.asset("icons/breakfast2.svg", height: height, width: width);
    }
    else if(tags.contains("Stew") || tags.contains("Soup")){
      return SvgPicture.asset("icons/noodles.svg", height: height, width: width);
    }
    else{
      print(tags);
      return SvgPicture.asset("icons/casserole.svg", height: height, width: width);
    }
  }
}
