import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_with_mvvm/provider_example/provider/favourites_provder.dart';
import 'package:provider_with_mvvm/provider_example/provider/theme_changer_provider.dart';
import 'package:provider_with_mvvm/provider_example/utils/utils.dart';
import 'provider_example/provider/count_provider.dart';
import 'provider_example/provider/slider_provider.dart';
import 'home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // multi provider
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CountProvider()),
        ChangeNotifierProvider(create: (context) => SliderProvider()),
        ChangeNotifierProvider(create: (context) => FavouritesProvder()),
        ChangeNotifierProvider(create: (context) => ThemeChangerProvider())
      ],
      child: Builder(
        builder: (context) {
          final themeChanger = Provider.of<ThemeChangerProvider>(context);
          return MaterialApp(
            themeMode: themeChanger.themeMode,
            theme: lightThemeData(),
            darkTheme: darkThemeData(),
            debugShowCheckedModeBanner: false,
            home: const HomeScreen(),
          );
        },
      ),
    );

    // single provider
    // return ChangeNotifierProvider(
    //   create: (context) => CountProvider(),
    //   child: MaterialApp(
    //     theme: ThemeData(
    //       useMaterial3: true,
    //       cardColor: Colors.amber,
    //     ),
    //     debugShowCheckedModeBanner: false,
    //     home: const HomeScreen(),
    //   ),
    // );
  }
}
