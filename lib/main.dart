import 'package:flutter/material.dart';
import 'package:mvc_recipe/service_locator.dart';
import 'package:mvc_recipe/src/app.dart';

void main() {
  setupServiceLocators();
  runApp(App());
}
