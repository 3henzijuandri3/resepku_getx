import 'package:get/get.dart';
import 'package:resepku_getx/services/recipe_service.dart';

import '../models/Recipe.dart';

class ListRecipeController extends GetxController{
  var isLoading = true.obs;
  var notFound = false.obs;

  final _listRecipe = <Recipe?>[].obs;
  List<Recipe?> get listRecipe => _listRecipe;

  void fetchListRecipe() async {
    isLoading(true);
    try{
      var listRecipeData = await RecipeService().getMultipleRecipe();
      _listRecipe.value = listRecipeData;
      notFound(false);
    }catch(e){
      rethrow;
    }finally{
      isLoading(false);

    }
  }

  void fetchListRecipeByCategory(String category) async {
    isLoading(true);
    try{
      var listRecipeData = await RecipeService().getRecipeByCategory(category);
      _listRecipe.value = listRecipeData;
      notFound(false);
    }catch(e){
      rethrow;
    }finally{
      isLoading(false);
    }
  }

  void fetchListRecipeByArea(String area) async {
    isLoading(true);
    try{
      var listRecipeData = await RecipeService().getRecipeByArea(area);
      _listRecipe.value = listRecipeData;
      notFound(false);
    }catch(e){
      rethrow;
    }finally{
      isLoading(false);
    }
  }

  void fetchListRecipeByName(String name) async {
    isLoading(true);
    try{
      var listRecipeData = await RecipeService().getRecipeByName(name);
      _listRecipe.value = listRecipeData;
      notFound(false);
    }catch(e){
      notFound(true);
      isLoading(false);
      rethrow;
    }finally{
      isLoading(false);
    }
  }
}