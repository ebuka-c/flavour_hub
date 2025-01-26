import 'package:flavor_hub/constants/app_data.dart';
import 'package:flavor_hub/screens/main_screens/secondary/fav_recipe_details.dart';
import 'package:flavor_hub/utilities/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../constants/colors.dart';
import '../../constants/custom_textstyles.dart';
import '../../widgets/nationality.dart';

class Favourites extends StatefulWidget {
  const Favourites({super.key});

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: false,
          elevation: 1,
          title: Text('Saved to Favourites')),
      body: myFavorites.isEmpty
          ? Center(child: Text('No favorites yet!'))
          : ListView.builder(
              itemBuilder: (_, index) {
                final recipe = myFavorites[index];
                return GestureDetector(
                  onTap: () {
                    var recipeName = recipe['name'];
                    var recipeFav = recipe['favourite'];
                    var recipeImg = recipe['image'];
                    var recipeIngred = recipe['ingredients'];
                    var recipeDur = recipe['duration'];

                    Get.to(FavRecipeDetails(
                        recipeName: recipeName,
                        recipeFav: recipeFav,
                        recipeImg: recipeImg,
                        recipeIngred: recipeIngred,
                        recipeDur: recipeDur,
                        recipeId: index));
                  },
                  child: Container(
                    width: double.infinity,
                    height: 120.0.h,
                    margin:
                        EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 10),
                    padding: EdgeInsets.all(8),
                    decoration:
                        BoxDecoration(color: AppColors.white, boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 1),
                          blurRadius: 5,
                          color: AppColors.black.withOpacity(0.1))
                    ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 120.0.w,
                          height: 80.0.h,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(recipe['image']),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(width: 10.0.w),
                        SizedBox(
                          width: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Nationality(
                                    nationality: recipe['nationality'],
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                      onTap: () {},
                                      child:
                                          Icon(Icons.share_rounded, size: 15)),
                                  SizedBox(width: 8.0.w),
                                  GestureDetector(
                                      onTap: () {
                                        setState(() async {
                                          recipe['favourite'] =
                                              !recipe['favourite'];
                                          if (!recipe['favourite']) {
                                            await myFavorites.removeAt(index);

                                            Get.snackbar(
                                              "Removed",
                                              "Recipe removed from favourites",
                                              snackPosition: SnackPosition.TOP,
                                              backgroundColor:
                                                  Colors.grey.withOpacity(0.2),
                                              icon: Icon(
                                                CupertinoIcons
                                                    .exclamationmark_circle,
                                                color: AppColors.appRed,
                                              ),
                                              colorText: AppColors.primaryText,
                                              duration:
                                                  const Duration(seconds: 1),
                                            );
                                          }
                                        });
                                      },
                                      child: Icon(
                                          recipe['favourite']
                                              ? Icons.favorite
                                              : Icons.favorite_outline,
                                          color: recipe['favourite']
                                              ? AppColors.appRed
                                              : null,
                                          size: 16))
                                ],
                              ),
                              SizedBox(height: 10.0.h),
                              SizedBox(
                                width: 170,
                                child: Text(
                                  recipe['name'],
                                  style: bodyMedium.copyWith(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  Icon(Icons.timer,
                                      size: 13, color: AppColors.lightText2),
                                  SizedBox(width: 5.0.w),
                                  Text(
                                    '${recipe['duration']} min',
                                    style: bodySmall.copyWith(
                                        color: AppColors.lightText2),
                                  ),
                                  const Spacer(),
                                  Icon(Iconsax.note_text,
                                      size: 13, color: AppColors.lightText2),
                                  SizedBox(width: 5.0.w),
                                  Text(
                                    '6 recipes',
                                    style: bodySmall.copyWith(
                                        color: AppColors.lightText2),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: myFavorites.length),
    );
  }
}
