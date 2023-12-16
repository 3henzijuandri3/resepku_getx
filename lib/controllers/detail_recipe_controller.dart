import 'package:get/get.dart';
import 'package:resepku_getx/models/Recipe.dart';
import 'package:resepku_getx/services/recipe_service.dart';

class DetailRecipeController extends GetxController{
  var isLoading = false.obs;
  final _detailRecipe = Rxn<Recipe?>();
  Recipe? get detailRecipe => _detailRecipe.value;

  void fetchDetailRecipe(String id) async {
    isLoading(true);
    try{
      var detailRecipeData = await RecipeService().getRecipeById(id);
      _detailRecipe.value = detailRecipeData.first;
    }catch(e){
      rethrow;
    }finally{
      isLoading(false);
    }
  }
}