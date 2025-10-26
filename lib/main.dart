import 'package:flutter/material.dart';
import 'package:news/routes.dart';
import 'package:news/ui/home_screen/home_screen.dart';
import 'package:news/ui/news_screens/news_screen.dart';
import 'package:news/ui/providers/theme_provider.dart';
import 'package:news/ui/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

import 'ui/resources/designs/design.dart';



void main() {
  runApp(ChangeNotifierProvider(
    create: (BuildContext context) => ThemeProvider() ,
      child: const MyApp()));
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(

      debugShowCheckedModeBanner: false,

      title: 'News App',

      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: themeProvider.getThemeMode ,

     routes:{
        AppRoutes.SplashScreen.route: (context) => SplashScreen(),
     },
      initialRoute: AppRoutes.SplashScreen.route,
    );
  }
}

