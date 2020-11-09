class RecipeIngredientController{

  List<String> ingredientList;

  RecipeIngredientController(List<String> ingredientList){
    this.ingredientList = processIngredientList(ingredientList.toList());
  }

  List<String> processIngredientList(List<String> list){
    list.removeWhere((element) => element == null);
    list.removeWhere((element) => element.trim().isEmpty);
    return list;
  }
}