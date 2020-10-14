import 'package:flutter/material.dart';

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
    );
  }
}