import 'package:flutter/material.dart';

import '../../shared/app_theme.dart';

class RandomRecipeCard extends StatelessWidget {
  final String recipeName;
  final String recipeCategory;
  final String recipeFrom;
  final String recipeImg;
  final Function onTap;
  final Function onRefreshTap;

  const RandomRecipeCard({
    Key? key,
    required this.recipeName,
    required this.recipeCategory,
    required this.recipeFrom,
    required this.recipeImg,
    required this.onTap, required this.onRefreshTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 230,

        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.6),
              offset: const Offset(
                0.0,
                10.0,
              ),
              blurRadius: 10.0,
              spreadRadius: -6.0,
            ),
          ],

          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(recipeImg),
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.35),
                BlendMode.multiply
                ,)
          ),
        ),

        child: Stack(
          children: [

            // Recipe Name
            Align(
              alignment: Alignment.center,
              child: Text(
                recipeName,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                maxLines: 2,
                style: whiteTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium
                ),
              ),
            ),

            // Recipe Category & Recipe From
            Align(
              alignment: Alignment.bottomLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  // Recipe Category
                  Container(
                    width: 110,
                    padding: const EdgeInsets.all(4),
                    margin: EdgeInsets.only(left: 8, bottom: 8),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(15),
                    ),

                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        // Kitchen Icon
                        Icon(
                          Icons.soup_kitchen_sharp,
                          color: yellowColor,
                          size: 15,
                        ),

                        const SizedBox(width: 4),

                        // Recipe Category
                        Text(
                          recipeCategory,
                          style: whiteTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: medium
                          ),
                        )
                      ],
                    ),
                  ),

                  // Recipe From
                  Container(
                    width: 110,
                    padding: const EdgeInsets.all(4),
                    margin: EdgeInsets.only(left: 8, bottom: 8),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(15),
                    ),

                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        // Star Icon
                        Icon(
                          Icons.flag_sharp,
                          color: yellowColor,
                          size: 15,
                        ),

                        const SizedBox(width: 4),

                        // Rating Number
                        Text(
                          recipeFrom,
                          style: whiteTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: medium
                          ),
                        )
                      ],
                    ),
                  ),

                ],
              ),
            ),

            Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                icon: Icon(Icons.refresh_outlined, size: 35, color: yellowColor),
                onPressed: () => onRefreshTap(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RecipeCategoryCard extends StatelessWidget {

  final String label;
  final String assetUrl;
  final Function onTap;

  const RecipeCategoryCard({Key? key, required this.label, required this.assetUrl ,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        width: 150,
        height: 100,

        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15),

          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(assetUrl),
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.35),
                BlendMode.multiply
              )
          ),
        ),

        child: Center(
          child: Text(
            label,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: whiteTextStyle.copyWith(
                fontSize: 18,
                fontWeight: medium
            ),
          ),
        ),
      ),
    );
  }
}

class RecipeCardCountry extends StatelessWidget {
  final String label;
  final double? width;
  final double? height;
  final String imgUrl;
  final Function onTap;

  const RecipeCardCountry({Key? key, required this.label, this.width, this.height, required this.imgUrl, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        width: 100,
        height: 80,

        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15),

          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(imgUrl),
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.35),
                  BlendMode.multiply
              )
          ),
        ),

        child: Center(
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: whiteTextStyle.copyWith(
                fontSize: 15,
                fontWeight: medium
            ),
          ),
        ),
      ),
    );
  }
}

class RecipeCard extends StatelessWidget {
  final String recipeName;
  final String assetUrl;
  final Function onTap;

  const RecipeCard({Key? key, required this.recipeName, required this.assetUrl ,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        width: 150,
        height: 100,

        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15),

          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(assetUrl),
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.35),
                  BlendMode.multiply
              )
          ),
        ),

        child: Center(
          child: Text(
            recipeName,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: whiteTextStyle.copyWith(
                fontSize: 18,
                fontWeight: medium
            ),
          ),
        ),
      )
    );
  }
}
