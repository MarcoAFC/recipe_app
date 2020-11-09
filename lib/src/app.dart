import 'package:flutter/material.dart';
import 'package:mvc_recipe/src/View/main_ingredient_search/main_ingredient_search_screen.dart';

import 'View/main_screen/home_screen.dart';
import 'View/theme/theme.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MVC Recipe Searcher",
      theme: ThemeBuilder.userTheme,
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        "/mainIngredient": (_) => MainIngredientSearchScreen(),
      },
    );
  }
}