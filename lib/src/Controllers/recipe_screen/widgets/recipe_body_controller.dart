class RecipeBodyController{
  List<String> processInstructions(String instructions){
    var instructionsList = instructions.split("\n");
    instructionsList.removeWhere((element) => element.trim().isEmpty);
    return instructionsList;
  }

  
}