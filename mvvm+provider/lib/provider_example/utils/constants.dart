import 'package:flutter/material.dart';
import 'package:provider_with_mvvm/provider_example/screen/favourites/favourites_screen.dart';
import 'package:provider_with_mvvm/provider_example/screen/light_and_dark_mode/dark_theme_screen.dart';
import 'package:provider_with_mvvm/provider_example/screen/multi_provider/multi_provider_screen.dart';
import 'package:provider_with_mvvm/provider_example/screen/single_provider/single_provider_screen.dart';
import 'package:provider_with_mvvm/provider_example/screen/stateless/stateless_counter.dart';

String txt = "Provider Example";
var map = <String, Widget>{
  "Single $txt": const SingleProvider(),
  "Multi $txt": const MultipleProvider(),
  "Favourites $txt": const FavouritesScreen(),
  "Stateless Counter $txt": StatelessCounter(),
  "Light And Dark Mode $txt": const DarkThemeScreen(),
};
