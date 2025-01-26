import 'package:flavor_hub/constants/app_data.dart';
import 'package:flavor_hub/constants/colors.dart';
import 'package:flavor_hub/constants/custom_textstyles.dart';
import 'package:flavor_hub/screens/main_screens/secondary/recipe_details.dart';
import 'package:flavor_hub/utilities/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../widgets/nationality.dart';
import '../../../widgets/search_textfield.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchCntrl = TextEditingController();
  List<Map> filteredRecipes = List.from(recipesTile);

  @override
  void initState() {
    super.initState();
    searchCntrl.addListener(() {
      filterRecipes();
    });
  }

  void filterRecipes() {
    String query = searchCntrl.text.toLowerCase();
    setState(() {
      // Filter recipes based on the search query
      filteredRecipes = recipesTile.where((recipe) {
        return recipe['name'].toLowerCase().contains(query) ||
            recipe['nationality'].toLowerCase().contains(query) ||
            (recipe['ingredients'] as List<String>)
                .any((ingredient) => ingredient.toLowerCase().contains(query));
      }).toList();
    });
  }

  @override
  void dispose() {
    searchCntrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.close, size: 17),
        ),
        centerTitle: false,
        title: Text('Search Recipes',
            style: titleSmall.copyWith(fontWeight: FontWeight.bold)),
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 55.0.h),
          child: Padding(
            padding: EdgeInsets.fromLTRB(15.0.w, 0, 15.0.w, 5.0.h),
            child: SearchTextField(
              controller: searchCntrl,
              inputBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: 'Search by name, ingredients or nationality',
              hintStyle: bodyMedium.copyWith(
                  color: AppColors.lightText2, fontFamily: ''),
              autoFocus: true,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0.h),
        child: filteredRecipes.isEmpty && searchCntrl.text.isEmpty
            ? Center(
                child: Text(
                  'Search to see results',
                  style: bodyMedium.copyWith(color: AppColors.lightText2),
                ),
              )
            : ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      var filteredName = filteredRecipes[index]['name'];
                      var filteredImage = filteredRecipes[index]['image'];
                      var filteredDuration = filteredRecipes[index]['duration'];
                      List<String> filteredIngred =
                          filteredRecipes[index]['ingredients'];
                      Get.to(RecipeDetails(
                          filteredName: filteredName,
                          filteredDuration: filteredDuration,
                          filteredImage: filteredImage,
                          filteredIngred: filteredIngred));
                    },
                    child: Container(
                      width: double.infinity,
                      height: 120.0.h,
                      margin: EdgeInsets.symmetric(horizontal: 15.0.w),
                      padding: EdgeInsets.all(8),
                      decoration:
                          BoxDecoration(color: AppColors.white, boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 1),
                          blurRadius: 5,
                          color: AppColors.black.withOpacity(0.1),
                        ),
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
                                image: NetworkImage(
                                    filteredRecipes[index]['image']),
                                fit: BoxFit.cover,
                              ),
                            ),
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
                                      nationality: filteredRecipes[index]
                                          ['nationality'],
                                    ),
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: () {},
                                      child:
                                          Icon(Icons.share_rounded, size: 15),
                                    ),
                                    SizedBox(width: 8.0.w),
                                    Icon(Icons.favorite_outline, size: 16),
                                  ],
                                ),
                                SizedBox(height: 10.0.h),
                                SizedBox(
                                  width: 170,
                                  child: Text(
                                    filteredRecipes[index]['name'],
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
                                      '${filteredRecipes[index]['duration']} min',
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
                separatorBuilder: (_, __) => SizedBox(height: 10.0.h),
                itemCount: filteredRecipes.length,
              ),
      ),
    );
  }
}
