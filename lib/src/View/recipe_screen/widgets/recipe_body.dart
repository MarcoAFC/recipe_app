import 'package:flutter/material.dart';
import 'package:mvc_recipe/src/Controllers/recipe_screen/widgets/recipe_body_controller.dart';

class RecipeBody extends StatelessWidget {
  final RecipeBodyController controller = RecipeBodyController();
  final String instructionString;

  RecipeBody({Key key, @required this.instructionString}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> instructions = controller.processInstructions(instructionString);
    List<Widget> columnItems = List.generate(
        instructions.length,
        (index) => Container(
          decoration: BoxDecoration(
            border: Border.fromBorderSide(BorderSide(
              width: 0.8,
              color:  Colors.grey[400]
            )),
          ),
          child: Row(
            children: [
              Container(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height*0.1
                ),
                width: MediaQuery.of(context).size.width*0.13,
                height: MediaQuery.of(context).size.height*0.025 * instructions[index].characters.length/30,
                child: Center(
                  child: Text(
                    (index+1).toString(),
                    style: TextStyle(
                      fontSize: 30
                    ),
                  ),
                )
              ),
              VerticalDivider(
                width: 5.0,
              ),
              Expanded(
                child: Text(instructions[index]),
              )
            ]
          ),
        ));
    return Expanded(
      child: Container(
        color: Theme.of(context).accentColor.withAlpha(20),
        child: ListView(
          children: columnItems,
        ),
      ),
    );
  }
}