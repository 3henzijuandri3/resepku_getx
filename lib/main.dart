import 'package:flutter/material.dart';
import 'package:resepku_getx/shared/app_theme.dart';
import 'package:resepku_getx/views/pages/all_recipes_page.dart';
import 'package:resepku_getx/views/pages/home_page.dart';
import 'package:resepku_getx/views/pages/onboarding_page.dart';
import 'package:resepku_getx/views/pages/recipe_detail_page.dart';
import 'package:resepku_getx/views/pages/splash_screen_page.dart';

import 'helper/RecipePassing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      debugShowCheckedModeBanner: false,

      theme: ThemeData(
          scaffoldBackgroundColor: lightBackgroundColor,
          appBarTheme: AppBarTheme(
            elevation: 0,
            centerTitle: true,
            backgroundColor: lightBackgroundColor,
            iconTheme: IconThemeData(
              color: blackColor,
            ),
            titleTextStyle: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold
            ),
          )
      ),

      routes: {
        '/': (context) => const SplashScreenPage(),
        '/onboarding': (context) => const OnboardingPage(),
        '/home': (context) => const HomePage(),

        '/all-recipe' : (context){
          final data = ModalRoute.of(context)!.settings.arguments as RecipePassing?;
          return AllRecipesPage(data: data);
        },

        '/recipe-detail': (context) {
          final recipeId = ModalRoute.of(context)!.settings.arguments as String;
          return RecipeDetailPage(recipeId: recipeId);
        }
      },
    );
  }
}


