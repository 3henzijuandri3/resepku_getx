import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resepku_getx/controllers/list_recipe_controller.dart';

import '../../helper/RecipePassing.dart';
import '../../shared/app_theme.dart';
import '../widgets/recipe_card_custom.dart';
import '../widgets/search_bar_custom.dart';

class AllRecipesPage extends StatefulWidget {

  final RecipePassing? data;

  const AllRecipesPage({Key? key, this.data}) : super(key: key);

  @override
  State<AllRecipesPage> createState() => _AllRecipesPageState();
}

class _AllRecipesPageState extends State<AllRecipesPage> {
  final listRecipeController = ListRecipeController();
  final recipeController = TextEditingController(text: '');


  @override
  void initState() {
    super.initState();

    if (widget.data?.type != null) {

      if (widget.data?.type == 'category') {
        log('category');
        listRecipeController.fetchListRecipeByCategory(widget.data!.value.toString());

      } else if (widget.data?.type == 'area') {
        log('area');
        listRecipeController.fetchListRecipeByArea(widget.data!.value.toString());
      }

    } else {
      listRecipeController.fetchListRecipe();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'All Recipe',
        ),
      ),

      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,

          children: [
            
            // Text
            Padding(
              padding: const EdgeInsets.only(left: 22, right: 22, top: 30),
              child: SearchBarCustom(
                title: 'Search Recipe',
                controller: recipeController,
                onFieldSubmitted: (value) {
                  if (value.isNotEmpty) {
                    listRecipeController.fetchListRecipeByName(recipeController.text);
                  } else {
                    listRecipeController.fetchListRecipe();
                  }
                  setState(() {});
                },
              ),
            ),

            // Text
            Padding(
              padding: const EdgeInsets.only(left: 22, top: 20, bottom: 6),
              child: Text(
                'Pick Recipe',
                style: blackTextStyle.copyWith(
                  fontSize: 15,
                  fontWeight: semiBold
                ),
              ),
            ),

            // List Recipe
            Flexible(
              child: GetX(
                  init: listRecipeController,

                  builder: (controller){
                    final isLoading = controller.isLoading.value;
                    final notFound = controller.notFound.value;
                    final listRecipe = controller.listRecipe;

                    if(isLoading){
                      return const Center(child: CircularProgressIndicator());
                    }

                    if(notFound){
                      return const Center(child: Text('Not Found :('));
                    }

                    return GridView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
                        itemCount: listRecipe.length,

                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20
                        ),

                        itemBuilder: (context, index) {
                          return RecipeCard(
                              recipeName: listRecipe[index]!.strMeal.toString(),
                              assetUrl: listRecipe[index]!.strMealThumb.toString(),
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  '/recipe-detail',
                                  arguments: listRecipe[index]!.idMeal, // Pass the recipeId as an argument
                                );
                              }
                          );
                        }
                    );
                  }
              ),
            ),

          ],
        ),
      ),
    );
  }
}

















