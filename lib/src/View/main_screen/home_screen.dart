import 'package:flutter/material.dart';
import 'package:mvc_recipe/src/Models/networking/providers/recipe_provider.dart';

import 'widgets/body.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  RecipeProvider recipeProvider = RecipeProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}