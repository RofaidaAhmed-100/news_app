import 'package:flutter/material.dart';
import 'package:news_app/My_theme_data.dart';
import 'package:news_app/home/home_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:MyThemeData.LightTheme ,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName:(context)=>HomeScreen(),
      },
    );
  }
}
