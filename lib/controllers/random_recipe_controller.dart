import 'dart:developer';

import 'package:get/get.dart';
import 'package:resepku_getx/models/Recipe.dart';
import 'package:resepku_getx/services/recipe_service.dart';

class RandomRecipeController extends GetxController{
  var isLoading = false.obs;
  final _randomRecipe = Rxn<Recipe?>();
  Recipe? get randomRecipe => _randomRecipe.value;

  @override
  void onInit() {
    super.onInit();
    fetchRandomRecipe();
  }

  void fetchRandomRecipe() async {
    isLoading(true);
    try {
      var randomRecipeData = await RecipeService().getRandomRecipe();
      _randomRecipe.value = randomRecipeData.first;
    } catch(e){
      rethrow;
    }finally{
      isLoading(false);
    }
  }

  clearState(){
    Get.delete<RandomRecipeController>(force: true);
  }
}