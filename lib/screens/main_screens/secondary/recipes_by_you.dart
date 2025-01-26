import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flavor_hub/utilities/extensions.dart';
import 'package:flavor_hub/widgets/button_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../constants/custom_textstyles.dart';
import '../../../constants/images.dart';
import 'recipe_screen.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class RecipesByYou extends StatefulWidget {
  const RecipesByYou({super.key});

  @override
  State<RecipesByYou> createState() => _RecipesByYouState();
}

class _RecipesByYouState extends State<RecipesByYou> {
  final Map<String, bool> _isDeleting = {};

  Future<void> deleteRecipe(String docId) async {
    setState(() {
      _isDeleting[docId] = true;
    });

    await Future.delayed(const Duration(seconds: 2));
    try {
      await _firestore.collection('recipes').doc(docId).delete();
    } on FirebaseException catch (e) {
      Get.snackbar(
        "Error deleting recipe",
        "${e.message}",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.grey.withOpacity(0.2),
        icon: Icon(
          CupertinoIcons.exclamationmark_circle,
          color: AppColors.appRed,
        ),
        colorText: AppColors.primaryText,
        duration: const Duration(seconds: 5),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 1,
          title: Text(
            'Your Recipes',
            style: titleMedium,
          ),
          foregroundColor: AppColors.lightText,
          actions: [
            CircleAvatar(
              radius: 15.0.h,
              foregroundImage: NetworkImage(AppImages.profileHeader),
              backgroundImage: AssetImage(AppImages.avatar),
              backgroundColor: AppColors.textfieldBorder,
            ),
            SizedBox(width: 15.0.w)
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection('recipes')
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                      child: AppLoadingIndicator(
                    color: AppColors.lightText2,
                  ));
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text("No recipes found."));
                }

                final recipes = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: recipes.length,
                  itemBuilder: (context, index) {
                    final recipe = recipes[index];
                    final docId = recipe.id;
                    final title = recipe['title'] ?? "Untitled";
                    final ingredients =
                        List<String>.from(recipe['ingredients'] ?? []);

                    return Card(
                      margin: const EdgeInsets.all(8.0),
                      color: AppColors.white,
                      child: ListTile(
                        title: Text(
                          title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: _isDeleting[docId] == true
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: AppLoadingIndicator(
                                  strokeWidth: 2,
                                  color: AppColors.lightText2,
                                ),
                              )
                            : DropdownButton<String>(
                                icon: const Icon(Icons.more_vert),
                                underline: const SizedBox(),
                                items: [
                                  DropdownMenuItem(
                                    value: "delete",
                                    child: Row(
                                      children: [
                                        Icon(Icons.delete,
                                            color: AppColors.appRed, size: 18),
                                        SizedBox(width: 8),
                                        Text(
                                          "Delete",
                                          style: bodyMedium.copyWith(
                                              color: AppColors.lightText),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                                onChanged: (value) {
                                  if (value == "delete") {
                                    deleteRecipe(docId);
                                  }
                                },
                              ),
                        onTap: () {
                          Get.to(
                            RecipeScreen(
                                title: title,
                                myIngredients: ingredients,
                                myRecipes: true),
                          );
                        },
                      ),
                    );
                  },
                );
              }),
        ));
  }
}
